import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import 'cart_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../generated/locale_keys.g.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          model.navToHomeByRemovingAll(); // Workaround
          return false;
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/success.json',
                  height: 0.3.sh,
                ),
                SizedBox(height: 0.1.sh),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    LocaleKeys.orderSuccess,
                    textAlign: TextAlign.center,
                    style: getDeviceType() == Constants.phone
                        ? ktsCartMealPricePhoneText
                        : ktsCartMealPriceText,
                  ).tr(),
                ),
                SizedBox(height: 0.1.sh),
                CustomTextChildButton(
                  color: kcFontColor,
                  borderRadius: kbr15,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
                  onPressed: model.navToHomeByRemovingAll,
                  child: Text(
                    LocaleKeys.homeScreen,
                    style: getDeviceType() == Constants.phone
                        ? ktsMealButtonPhoneText
                        : ktsMealButtonText,
                  ).tr(),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}
