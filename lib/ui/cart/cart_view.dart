import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import '../../generated/locale_keys.g.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';
import 'cart.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Here it is reactive instead of nonReactive is just bc delete cartMeal when its quantity is 0
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) {
        model.log.v('=================== CartView ===================');
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kcSecondaryDarkColor,
            elevation: 0.5,
            leadingWidth: 35.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: getDeviceType() == Constants.phone ? 18.sp : 16.sp,
                  color: kcFontColor,
                ),
                onPressed: model.navBack,
              ),
            ),
            centerTitle: true,
            title: Text(
              LocaleKeys.orders,
              style: getDeviceType() == Constants.phone
                  ? ktsCartTitlePhoneText
                  : ktsCartTitleText,
            ).tr(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: IconButton(
                  onPressed: () async => await model.showClearCartDialog(model),
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    size: getDeviceType() == Constants.phone ? 18.sp : 16.sp,
                    color: kcFontColor,
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: model.cartMeals.isNotEmpty
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: CustomTextChildButton(
                    color: kcFontColor,
                    borderRadius: kbr15,
                    padding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                    onPressed: model.isBusy
                        ? () {}
                        : () async => await model.createOrder(
                              onFailForView: () async =>
                                  await showErrorFlashBar(context: context),
                            ),
                    child: Row(
                      mainAxisAlignment: model.isBusy
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        if (model.isBusy)
                          FittedBox(
                            child: SpinKitSpinningLines(
                              size: getDeviceType() == Constants.phone
                                  ? 14.sp
                                  : 12.sp,
                              itemCount: 4,
                              color: kcSecondaryDarkColor,
                            ),
                          ),
                        if (!model.isBusy)
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: Text(
                              LocaleKeys.orderNow,
                              style: getDeviceType() == Constants.phone
                                  ? ktsMealButtonPhoneText
                                  : ktsMealButtonText,
                            ).tr(),
                          ),
                        if (!model.isBusy)
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Text(
                                    LocaleKeys.total,
                                    style: getDeviceType() == Constants.phone
                                        ? ktsMealButtonPhoneText
                                        : ktsMealButtonText,
                                  ).tr(),
                                ),
                                Text(
                                  '${formatNum(model.getTotalCartMealsSum)} TMT',
                                  style: getDeviceType() == Constants.phone
                                      ? ktsMealButtonPhoneText
                                      : ktsMealButtonText,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                top: 20.h, left: 16.w, right: 16.w, bottom: 74.h),
            itemCount: model.cartMeals.length,
            itemBuilder: (context, pos) =>
                CartMealWidget(cartMeal: model.cartMeals[pos]),
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Divider(
                  thickness: 1,
                  color: kcFontColor.withOpacity(0.5),
                ),
              );
            },
          ),
        );
      },
      viewModelBuilder: () => CartViewModel(),
    );
  }
}
