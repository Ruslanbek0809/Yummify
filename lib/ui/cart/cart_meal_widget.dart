import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../models/hive_models/hive_meal.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';
import 'cart.dart';

class CartMealWidget extends ViewModelWidget<CartViewModel> {
  final HiveMeal cartMeal;
  const CartMealWidget({Key? key, required this.cartMeal})
      : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, CartViewModel viewModel) {
    viewModel.log.v('CartMealWidget =========');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YummifyImage(
          image: cartMeal.image!,
          height: 0.25.sw,
          width: 0.25.sw,
          borderRadius: 10.0,
          phImage: 'assets/ph_meal.png',
        ),
        Expanded(
          child: Container(
            height:
                0.25.sw, // MAKES Column apply MainAxisAlignment.spaceBetween
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          cartMeal.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: ktsCartMealText,
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            '${formatNum(viewModel.getTotalMealSum(cartMeal))} TMT',
                            style: ktsCartMealPriceText,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Text(
                        '${formatNum(cartMeal.price!)} TMT',
                        style: ktsCartMealText,
                      ),
                    ),
                  ],
                ),
                //------------------ BUTTONS ---------------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      color: kcFontColor,
                      borderRadius: kbr15,
                      elevation: 0,
                      child: InkWell(
                        borderRadius: kbr15,
                        onTap: () async => cartMeal.quantity! == 1
                            ? await viewModel.showRemoveCartMealDialog(
                                viewModel, cartMeal)
                            : await viewModel.updateCartMealInCart(
                                cartMeal, cartMeal.quantity! - 1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 12.w,
                            color: kcSecondaryDarkColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        cartMeal.quantity.toString(),
                        style: ktsQuantityText,
                      ),
                    ),
                    Material(
                      color: kcFontColor,
                      borderRadius: kbr15,
                      elevation: 0,
                      child: InkWell(
                        borderRadius: kbr15,
                        onTap: () async => await viewModel.updateCartMealInCart(
                            cartMeal, cartMeal.quantity! + 1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 12.w,
                            color: kcSecondaryDarkColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
