import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/locale_keys.g.dart';
import '../../../models/models.dart';
import '../../../shared/shared.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/widgets.dart';
import 'meal_view_model.dart';
import 'package:easy_localization/easy_localization.dart';

class MealBottomSheetView extends StatelessWidget {
  final ScrollController scrollController;
  final double offset;
  final MealModel meal;
  final MealViewModel mealViewModel;
  const MealBottomSheetView({
    Key? key,
    required this.scrollController,
    required this.offset,
    required this.meal,
    required this.mealViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealViewModel>.reactive(
      onModelReady: (model) => model.setOnModelReadyForMealBottomSheet(),
      viewModelBuilder: () => mealViewModel,
      disposeViewModel: false,
      builder: (context, model, child) => ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(Constants.BORDER_RADIUS_20),
        ),
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(Constants.BORDER_RADIUS_20),
              ),
              child: YummifyImage(
                image: meal.image!,
                height: 1.sw,
                width: 1.sw,
                phImage: 'assets/ph_meal.png',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kcSecondaryDarkColor,
                border: Border.all(color: kcFontColor, width: 0.1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  //----------- MEAL INFO --------------//
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            meal.name!,
                            style: getDeviceType() == Constants.phone
                                ? ktsMealPhoneText
                                : ktsMealPriceText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            '${formatNum(model.totalMealSumInBottomSheet)} TMT',
                            style: getDeviceType() == Constants.phone
                                ? ktsMealPhoneText
                                : ktsMealPriceText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //----------- BOTTOM CART BUTTON --------------//
                  //----------- QUANTITY BUTTONS --------------//
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kcSecondaryDarkColor,
                              borderRadius: kbr15,
                              border: Border.all(
                                color: kcFontColor,
                                width: 0.75,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Material(
                                    color: kcSecondaryDarkColor,
                                    borderRadius: kbr15,
                                    elevation: 0,
                                    child: InkWell(
                                      borderRadius: kbr15,
                                      onTap:
                                          model.subtractQuantityInBottomSheet,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Icon(
                                          Icons.remove,
                                          size:
                                              getDeviceType() == Constants.phone
                                                  ? 20.w
                                                  : 18.w,
                                          color: kcFontColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  model.quantityInBottomSheet.toString(),
                                  style: getDeviceType() == Constants.phone
                                      ? ktsQuantityPhoneText
                                      : ktsQuantityText,
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Material(
                                    color: kcSecondaryDarkColor,
                                    borderRadius: kbr15,
                                    elevation: 0,
                                    child: InkWell(
                                      borderRadius: kbr15,
                                      onTap: model.addQuantityInBottomSheet,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Icon(
                                          Icons.add,
                                          size:
                                              getDeviceType() == Constants.phone
                                                  ? 20.w
                                                  : 18.w,
                                          color: kcFontColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          flex: 3,
                          child: CustomTextChildButton(
                            color: kcFontColor,
                            borderRadius: kbr15,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            onPressed: () async {
                              await model
                                  .addOrIncreaseMealInCartFromMealBottomSheet();
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                            child: Text(
                              LocaleKeys.add,
                              style: getDeviceType() == Constants.phone
                                  ? ktsMealButtonPhoneText
                                  : ktsMealButtonText,
                            ).tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
