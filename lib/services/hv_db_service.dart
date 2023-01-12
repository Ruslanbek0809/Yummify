import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import '../app/app.logger.dart';
import '../models/models.dart';
import '../shared/shared.dart';

// Step 1 of Reactive Service. _selectedHiveTable and _cartMeals changes and updates in real time
class HiveDbService with ReactiveServiceMixin {
  final log = getLogger('HiveDbService');

  HiveDbService() {
    // Step 3
    listenToReactiveValues([_selectedHiveTable, _cartMeals]);
  }

  static late Box<HiveTable> tableBox;
  static late Box<HiveMeal> cartBox;

  // Step 2
  final _selectedHiveTable =
      ReactiveValue<HiveTable>(HiveTable(id: -1, name: 'Default'));
  HiveTable get selectedHiveTable => _selectedHiveTable.value;

  // Step 2
  final _cartMeals = ReactiveValue<List<HiveMeal>>([]);
  List<HiveMeal> get cartMeals => _cartMeals.value;

  /// INITIALIZE in StartUpViewModel
  Future initializeHiveBoxes() async {
    log.v('====== HiveDbService STARTED opening boxes ======');

    await Hive.openBox<HiveTable>(Constants.tableBox);
    await Hive.openBox<HiveMeal>(Constants.cartBox);

    log.v('====== HiveDbService ENDED opening boxes ======');
  }

  /// GETS table from tableBox
  void getHiveTable() {
    tableBox = Hive.box<HiveTable>(Constants.tableBox);

    _selectedHiveTable.value = tableBox.get(Constants.selectedHiveTable,
        defaultValue: HiveTable(id: -1, name: 'Default'))!;
    log.v('_selectedHiveTable.value.id ${_selectedHiveTable.value.id}');
  }

  /// GETS all CART meals from cartBox
  void getCartMeals() {
    cartBox = Hive.box<HiveMeal>(Constants.cartBox);
    _cartMeals.value = cartBox.values.toList();

    log.v('_cartMeals.value.length: ${_cartMeals.value.length}');
  }

//---------------------------------------//
//------------------ TABLE PART ---------------------//
//---------------------------------------//

  /// UPDATES a selected table model in HIVE
  Future<void> updateTableInHive(TableModel selectedTableModel) async {
    log.i('tableModel.id: ${selectedTableModel.id}');

    try {
      final HiveTable tempSelectedHiveTable = HiveTable(
        id: selectedTableModel.id,
        name: selectedTableModel.name,
      );

      await tableBox.put(Constants.selectedHiveTable, tempSelectedHiveTable);
      _selectedHiveTable.value = tableBox.get(
        Constants.selectedHiveTable,
        defaultValue: HiveTable(id: -1, name: 'Default'),
      )!;

      log.v('_selectedHiveTable.value.id ${_selectedHiveTable.value.id}');
    } catch (e) {
      log.v('Couldn\'t UPDATE a table in HIVE: $e');
    }
  }

//---------------------------------------//
//------------------ MEAL PART ---------------------//
//---------------------------------------//

  /// GETS a specific meal's quantity
  int getMealQuantity(int mealId) {
    int quantity = 0;
    for (HiveMeal cartMeal in _cartMeals.value) {
      if (cartMeal.id == mealId) quantity += cartMeal.quantity!;
    }

    // log.v(' quantity: $quantity');
    return quantity;
  }

  /// ADDS a specific meal to CART or INCREASES quantity of a meal in CART
  Future<void> addOrIncreaseMealInCart(
    MealModel meal, {
    int quantity =
        1, // CHANGES when meal is ADDED or UPDATED from MEAL BOTTOM SHEET
  }) async {
    log.v('mealId: ${meal.id}, quantity: $quantity');

    /// GETS lastMeal from these meals
    /// firstWhereOrNull is a new method of package:collection
    HiveMeal? selectedMeal =
        _cartMeals.value.firstWhereOrNull((cartMeal) => cartMeal.id == meal.id);
    int pos = -1;
    if (selectedMeal != null) pos = _cartMeals.value.indexOf(selectedMeal);
    log.v('pos of _selectedMeal: $pos');

    /// ADD PART
    if (pos == -1) {
      log.v('ADDS a meal');

      try {
        final HiveMeal cartMeal = HiveMeal(
          id: meal.id,
          image: meal.image,
          name: meal.name,
          price: meal.price,
          quantity: quantity,
        );

        await cartBox.add(cartMeal);

        /// METHOD 1:
        /// _cartMeals.value.add(_cartMeal);

        /// METHOD 2: It is used instead of METHOD 1, because stacked reactivity
        _cartMeals.value = cartBox.values.toList();

        log.v('_cartMeals.value.length: ${_cartMeals.value.length}');
      } catch (e) {
        log.v('Couldn\'t ADD a meal to CART: $e');
      }
    }

    /// INCREASE PART
    else {
      log.v('INCREASES quantity of a meal');

      _cartMeals.value[pos].quantity =
          _cartMeals.value[pos].quantity! + quantity;

      await cartBox.putAt(pos, _cartMeals.value[pos]);

      /// METHOD 2: It is used instead of METHOD 1, because stacked reactivity
      _cartMeals.value = cartBox.values.toList();
      log.v(
          '_cartMeals.value[pos].quantity: ${_cartMeals.value[pos].quantity}');
    }
  }

  /// SUBTRACTS quantity of a meal in CART or REMOVES a meal from CART
  Future<void> subtractOrRemoveMealInCart(int? mealId) async {
    log.v('mealId: $mealId');

    /// GETS _selectedMeal from these meals
    HiveMeal? selectedMeal =
        _cartMeals.value.firstWhere((meal) => meal.id == mealId);
    int pos = _cartMeals.value.indexOf(selectedMeal);

    /// SUBTRACTING
    if (selectedMeal.quantity! > 1) {
      log.v('SUBTRACTING _selectedMeal');

      _cartMeals.value[pos].quantity = _cartMeals.value[pos].quantity! - 1;

      await cartBox.putAt(pos, _cartMeals.value[pos]);
      log.v(
          '_selectedMeal.quantity AFTER SUBTRACTING: ${selectedMeal.quantity}');
    }

    /// REMOVING
    else {
      log.v(
          'REMOVING _selectedMeal when _cartMeals.value.length: ${_cartMeals.value.length}');
      await cartBox.deleteAt(pos);

      /// METHOD 1:
      // _cartMeals.value.removeAt(pos);

      /// METHOD 2: It is used instead of METHOD 1, because stacked reactivity
      _cartMeals.value = cartBox.values.toList();

      log.v(
          'AFTER REMOVING _cartMeals.value.length: ${_cartMeals.value.length}');
    }
  }

//---------------------------------------//
//----------------------- CART VIEW PART --------------------------//
//---------------------------------------//

  /// UPDATES a cart meal in cartMeals
  Future<void> updateCartMealInCart(HiveMeal? cartMeal, int? quantity) async {
    log.i('cartMeal.id: ${cartMeal!.id}, quantity: $quantity');

    int pos = _cartMeals.value.indexOf(cartMeal);
    if (pos == -1) return;

    if (quantity! >= 1) {
      log.v('UPDATING cart meal\'s ');
      _cartMeals.value[pos].quantity = quantity;
      await cartBox.putAt(pos, _cartMeals.value[pos]);
      log.v(
          'AFTER UPDATING _cartMeals.value[pos].quantity: ${_cartMeals.value[pos].quantity}');
    } else {
      log.v('REMOVING cart meal ');
      await cartBox.deleteAt(pos);

      /// METHOD 1:
      // _cartMeals.value.removeAt(pos);

      /// METHOD 2: It is used instead of METHOD 1, because stacked reactivity
      _cartMeals.value = cartBox.values.toList();
      log.v(
          'AFTER REMOVING _cartMeals.value.length: ${_cartMeals.value.length}');
    }
  }

  /// CLEARS CART
  Future<void> clearCart() async {
    log.v('BEFORE CLEAR _cartMeals.value length: ${_cartMeals.value.length}');
    await cartBox.clear();
    _cartMeals.value.clear();

    log.v('AFTER CLEAR _cartMeals.value length: ${_cartMeals.value.length}');
  }
}
