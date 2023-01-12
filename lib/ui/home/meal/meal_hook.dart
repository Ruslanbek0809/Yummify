import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:yummify/widgets/widgets.dart';
import '../../../models/models.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../../shared/shared.dart';
import 'meal_bottom_sheet_view.dart';
import 'meal_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealHook extends HookViewModelWidget<MealViewModel> {
  final MealModel meal;
  const MealHook({
    Key? key,
    required this.meal,
  }) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, MealViewModel viewModel) {
    Tween<double> tween = Tween(begin: 1, end: 0.98);
    final tweenController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );

    /// To dispose a status listener attached to _tweenController
    useEffect(() {
      tweenController.addStatusListener((AnimationStatus status) {
        // This listener was used to repeat animation once
        if (status == AnimationStatus.completed) {
          tweenController.reverse();
        }
      });
      return () =>
          tweenController.removeStatusListener((AnimationStatus status) {
            // This listener was used to repeat animation once
            if (status == AnimationStatus.completed) {
              tweenController.reverse();
            }
          });
    }, [tweenController]);

    return ScaleTransition(
      scale: tween.animate(
        CurvedAnimation(
          parent: tweenController,
          curve: Curves.bounceInOut,
        ),
      ),
      child: GestureDetector(
        onTap: () async {
          await tweenController.forward();

          //------------------ MEAL BOTTOM SHEET ---------------------//
          //------------------ CUSTOM PACKAGE ---------------------//
          await showFlexibleBottomSheet(
            isExpand: false,
            initHeight: 0.95,
            maxHeight: 0.95,
            duration: const Duration(milliseconds: 250),
            context: context,
            bottomSheetColor: Colors.transparent,
            builder: (context, scrollController, offset) {
              return CustomModalBottomSheet(
                child: MealBottomSheetView(
                  scrollController: scrollController,
                  offset: offset,
                  meal: meal,
                  mealViewModel: viewModel,
                ),
              );
            },
          );
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: kcSecondaryDarkColor,
                borderRadius: kbr20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //------------------ IMAGE with DISCOUNT(if needed) ---------------------//
                  YummifyImage(
                    image: meal.image!,
                    height: constraints.maxWidth,
                    borderRadius: 20.0,
                    phImage: 'assets/ph_meal.png',
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7.h,
                            left: 6.w,
                            right: 6.w,
                          ),
                          child: Text(
                            meal.name!,
                            maxLines: 2,
                            style: getDeviceType() == Constants.phone
                                ? ktsMealPhoneText
                                : ktsMealText,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        //------------------ MEAL PRICE ---------------------//
                        viewModel.mealQuantity > 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: 6.w,
                                  right: 6.w,
                                  top: 5.h,
                                ),
                                child: Text(
                                  '${formatNum(meal.price!)} TMT',
                                  style: getDeviceType() == Constants.phone
                                      ? ktsMealPricePhoneText
                                      : ktsMealPriceText,
                                ),
                              )
                            : const SizedBox(),
                        const Spacer(),
                        //------------------ BUTTONS ---------------------//
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 6.h),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child:

                                //------------------ If Meal ADDED ---------------------//
                                viewModel.mealQuantity > 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Material(
                                            color: kcFontColor,
                                            borderRadius: kbr15,
                                            elevation: 3,
                                            shadowColor: kcSecondaryDarkColor
                                                .withOpacity(0.3),
                                            child: InkWell(
                                              borderRadius: kbr15,
                                              onTap: () async {
                                                /// SUBTRACTS quantity of a meal or REMOVES a meal from CART
                                                await viewModel
                                                    .subtractOrRemoveMealInCart();
                                                await tweenController.forward();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 10.h,
                                                ),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: getDeviceType() ==
                                                          Constants.phone
                                                      ? 12.w
                                                      : 11.w,
                                                  color: kcSecondaryDarkColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            viewModel.mealQuantity.toString(),
                                            style: getDeviceType() ==
                                                    Constants.phone
                                                ? ktsQuantityPhoneText
                                                : ktsQuantityText,
                                          ),
                                          Material(
                                            color: kcFontColor,
                                            borderRadius: kbr15,
                                            elevation: 3,
                                            shadowColor: kcSecondaryDarkColor
                                                .withOpacity(0.3),
                                            child: InkWell(
                                              borderRadius: kbr15,
                                              onTap: () async {
                                                /// INCREASES meal's quantity in CART
                                                await viewModel
                                                    .addOrIncreaseMealInCart();
                                                await tweenController.forward();
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 10.h,
                                                ),
                                                child: Icon(
                                                  Icons.add,
                                                  size: getDeviceType() ==
                                                          Constants.phone
                                                      ? 12.w
                                                      : 11.w,
                                                  color: kcSecondaryDarkColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    //------------------ If Meal NOT ADDED ---------------------//
                                    : Material(
                                        color: kcFontColor,
                                        borderRadius: kbr15,
                                        elevation: 3,
                                        shadowColor: kcSecondaryDarkColor
                                            .withOpacity(0.3),
                                        child: InkWell(
                                          borderRadius: kbr15,
                                          onTap: () async {
                                            /// ADDS a meal to CART
                                            await viewModel
                                                .addOrIncreaseMealInCart();
                                            await tweenController.forward();
                                          },
                                          child: Ink(
                                            width: constraints.maxWidth,
                                            decoration: BoxDecoration(
                                              color: kcFontColor,
                                              borderRadius: kbr15,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.h,
                                            ),
                                            child: Text(
                                              '${formatNum(meal.price!)} TMT',
                                              textAlign: TextAlign.center,
                                              style: getDeviceType() ==
                                                      Constants.phone
                                                  ? ktsMealButtonPhoneText
                                                  : ktsMealButtonText,
                                            ),
                                          ),
                                        ),
                                      ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
