import 'package:easy_localization/easy_localization.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generated/locale_keys.g.dart';

/// Enum for connectivity
enum ConnectivityStatus { Idle, WiFi, Cellular, Offline }

/// Method to round trailing zero based on its type.

// toStringAsFixed guarantees the specified number of fractional
// digits, so the regular expression is simpler than it would need to
// be for more general cases.
String formatNum(num value) =>
    value.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');

/// Enum for dialog types
enum DialogType {
  removeCartMeal,
  clearCart,
}

List<String> appLangs = [
  LocaleKeys.lang_en,
  LocaleKeys.lang_ru,
];

Future<void> showErrorFlashBar({
  required BuildContext context,
  String msg = LocaleKeys.errorOccured,
}) async {
  await showFlash(
    context: context,
    duration: const Duration(milliseconds: 2000),
    builder: (context, controller) {
      return Flash(
        backgroundColor: kcSecondaryDarkColor,
        controller: controller,
        borderRadius: kbr15,
        boxShadows: kElevationToShadow[0],
        position: FlashPosition.bottom,
        barrierDismissible: true,
        behavior: FlashBehavior.floating,
        margin: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 0.1.sh,
        ),
        child: FlashBar(
          icon: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 12.w),
            child: SvgPicture.asset(
              'assets/warning.svg',
              width: 20.w,
              height: 20.h,
              color: kcFontColor,
            ),
          ),
          content: Text(msg, style: ktsInfoText).tr(),
        ),
      );
    },
  );
}

String getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  // printLog('getDeviceType(): ${data.size.shortestSide}');
  return data.size.shortestSide < 600 ? Constants.phone : Constants.tablet;
}

/// Radiuses
BorderRadius get radius20 => BorderRadius.circular(20.0);
BorderRadius get radius15 => BorderRadius.circular(15.0);
BorderRadius get radius16 => BorderRadius.circular(16.0);
BorderRadius get radius12 => BorderRadius.circular(12.0);
BorderRadius get radius10 => BorderRadius.circular(10.0);
BorderRadius get radius5 => BorderRadius.circular(5.0);
