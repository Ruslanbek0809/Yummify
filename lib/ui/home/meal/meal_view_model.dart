import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

/// ReactiveViewModel is used to "react"
class MealViewModel extends ReactiveViewModel {
  final log = getLogger('MealViewModel');
  final MealModel meal;
  MealViewModel(this.meal);

  final _hiveDbService = locator<HiveDbService>();

  //----------- MEAL HOOK PART ------------//

  /// This mealQuantity is used in UI part instead of quantity var so that UI to be updated without any Workarounds
  int get mealQuantity => _hiveDbService.getMealQuantity(meal.id!);

  /// ADDS a meal to CART or INCREASES meal's quantity in CART
  Future<void> addOrIncreaseMealInCart() async {
    await _hiveDbService.addOrIncreaseMealInCart(meal);
    notifyListeners();
  }

  /// SUBTRACTS quantity of a meal or REMOVES a meal from CART
  Future<void> subtractOrRemoveMealInCart() async {
    await _hiveDbService.subtractOrRemoveMealInCart(meal.id);
    notifyListeners();
  }

  //----------- MEAL BOTTOM SHEET PART ------------//

  /// CREATES INITIAL state when MEAL BOTTOM SHEET is pressed
  /// These below 2 lines are implemented for rare issue cases: when user dismisses mealBottomSheet without action it preserves meal's quantity. It solves this issue.
  int _quantityInBottomSheet = 1;
  int get quantityInBottomSheet => _quantityInBottomSheet;

  num _totalMealSumInBottomSheet = 0;
  num get totalMealSumInBottomSheet => _totalMealSumInBottomSheet;

  /// CREATES INITIAL state when MEAL BOTTOM SHEET is pressed
  void setOnModelReadyForMealBottomSheet() {
    log.i('setOnModelReadyVolsCustoms()');

    /// if this meal already ADDED then give its quantity value to initial _quantityDraft
    if (mealQuantity != 0) _quantityInBottomSheet = mealQuantity;

    /// GET meals totalSum
    _totalMealSumInBottomSheet = meal.price!;
    _totalMealSumInBottomSheet *= _quantityInBottomSheet;
  }

  /// ADDS to _quantityInBottomSheet in MEAL BOTTOM SHEET
  void addQuantityInBottomSheet() {
    log.i(
        'addQuantityInBottomSheet() _quantityInBottomSheet: $_quantityInBottomSheet');

    _quantityInBottomSheet += 1;

    /// ADDS a meal's price to _totalMealSumInBottomSheet
    _totalMealSumInBottomSheet += meal.price!;

    log.i(
        'AFTER addQuantityInBottomSheet() _quantityInBottomSheet: $_quantityInBottomSheet');
    notifyListeners();
  }

  /// SUBTRACTS from _quantityInBottomSheet in MEAL BOTTOM SHEET
  void subtractQuantityInBottomSheet() {
    log.i(
        'subtractQuantityInBottomSheet() _quantityInBottomSheet: $_quantityInBottomSheet');

    /// IF _quantityInBottomSheet is already 1, then just RETURN without any action
    if (_quantityInBottomSheet <= 1) return;
    _quantityInBottomSheet -= 1;

    /// SUBTRACTS a meal's price from _totalMealSumInBottomSheet
    _totalMealSumInBottomSheet -= meal.price!;

    log.i(
        'AFTER subtractQuantityInBottomSheet() _quantityInBottomSheet: $_quantityInBottomSheet');
    notifyListeners();
  }

  /// ADDS a meal to CART from MEAL BOTTOM SHEET or INCREASES quantity of a meal in CART from MEAL BOTTOM SHEET
  Future<void> addOrIncreaseMealInCartFromMealBottomSheet() async {
    await _hiveDbService.addOrIncreaseMealInCart(meal,
        quantity: _quantityInBottomSheet);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
