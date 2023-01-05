import '../ui/cart/cart_view_model.dart';
import 'hive_models/hive_meal.dart';

class CartMealDialogData {
  CartMealDialogData({
    required this.cartViewModel,
    required this.cartMeal,
  });
  final CartViewModel cartViewModel;
  final HiveMeal cartMeal;
}
