import '../../models/hive_models/hive_table.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../generated/locale_keys.g.dart';
import '../../models/cart_meal_dialog_data.dart';
import '../../models/hive_models/hive_meal.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';

class CartViewModel extends ReactiveViewModel {
  final log = getLogger('CartViewModel');

  final _api = locator<ApiService>();
  final _hiveDbService = locator<HiveDbService>();
  final _dialogService = locator<DialogService>();
  final _navService = locator<NavigationService>();

  HiveTable get selectedHiveTable => _hiveDbService.selectedHiveTable;
  List<HiveMeal> get cartMeals => _hiveDbService.cartMeals;

  /// CLEARS CART
  Future<void> clearCart() async {
    log.i('clearCart()');

    await _hiveDbService.clearCart();
    await _navService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  /// GETS total cart meals' SUM
  num get getTotalCartMealsSum {
    num totalCartSum = 0;
    for (HiveMeal cartMeal in _hiveDbService.cartMeals) {
      totalCartSum += cartMeal.price! * cartMeal.quantity!;
    }

    return totalCartSum;
  }

//------------------------ Clear CART DIALOG PART ----------------------------//

  /// SHOWS Clear CART Dialog
  Future showClearCartDialog(CartViewModel cartViewModel) async {
    log.i('showClearCartDialog()');
    await _dialogService.showCustomDialog(
      variant: DialogType.clearCart,
      title: LocaleKeys.wannaClearCart,
      mainButtonTitle: LocaleKeys.no,
      secondaryButtonTitle: LocaleKeys.letsClearCart,
      showIconInMainButton: false,
      barrierDismissible: true,
      data: cartViewModel,
    );
  }

//------------------------ CART MEAL REMOVE DIALOG ----------------------------//

  /// SHOWS CART MEAL REMOVE Dialog
  Future showRemoveCartMealDialog(
      CartViewModel cartViewModel, HiveMeal cartMeal) async {
    log.i('showRemoveCartMealDialog()');
    await _dialogService.showCustomDialog(
      variant: DialogType.removeCartMeal,
      title: LocaleKeys.wannaRemoveMeal,
      mainButtonTitle: LocaleKeys.no,
      secondaryButtonTitle: LocaleKeys.remove,
      showIconInMainButton: false,
      barrierDismissible: true,
      data: CartMealDialogData(
        cartViewModel: cartViewModel,
        cartMeal: cartMeal,
      ),
    );
  }

//------------------------ CART MEAL ----------------------------//

  /// GETS total cart meal's SUM
  num getTotalMealSum(HiveMeal cartMeal) {
    num totalCartMealSum = 0;
    totalCartMealSum += cartMeal.price!;
    totalCartMealSum *= cartMeal.quantity!;
    return totalCartMealSum;
  }

  /// UPDATES cartMeal. If cartMeals is empty then navBack bc CartView is empty
  Future<void> updateCartMealInCart(
    HiveMeal cartMeal,
    int? mealQuantity,
  ) async {
    log.i(
        'updateCartMealInCart() cartMeal.id: ${cartMeal.id}, mealQuantity: $mealQuantity');

    await _hiveDbService.updateCartMealInCart(cartMeal, mealQuantity);

    if (cartMeals.isEmpty) {
      await _navService.pushNamedAndRemoveUntil(Routes.homeView);
    }

    notifyListeners();
  }

  /// CREATES a new order
  Future<void> createOrder({Function()? onFailForView}) async =>
      await runBusyFuture(
        _api.createOrder(
          selectedHiveTable,
          cartMeals,
          () async {
            await _hiveDbService.clearCart();
            await _navService.pushNamedAndRemoveUntil(Routes.successView);
          },
          () => onFailForView!(),
        ),
      );

//------------------------ NAVIGATION ----------------------------//
  void navBack() => _navService.back(result: true);

  /// NAVIGATES to Home by removing all previous routes
  Future<void> navToHomeByRemovingAll() async =>
      await _navService.pushNamedAndRemoveUntil(Routes.homeView);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_hiveDbService];
}
