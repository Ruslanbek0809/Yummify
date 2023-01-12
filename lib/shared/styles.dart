import 'package:flutter/cupertino.dart';
import 'shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// =========== Text Styles ============ //

TextStyle ktsLogoText = TextStyle(
  fontSize: 8.sp,
  color: kcFontColor,
);

TextStyle ktsInfoText = TextStyle(
  fontSize: 10.sp,
  color: kcFontColor,
);

TextStyle ktsCatText = TextStyle(
  fontSize: 12.sp,
  color: kcFontColor,
);

TextStyle ktsCatPhoneText = TextStyle(
  fontSize: 14.sp,
  color: kcFontColor,
);

TextStyle ktsMealText = TextStyle(
  fontSize: 8.sp,
  color: kcFontColor,
);

TextStyle ktsMealPhoneText = TextStyle(
  fontSize: 12.sp,
  color: kcFontColor,
);

TextStyle ktsMealPriceText = TextStyle(
  fontSize: 10.sp,
  color: kcFontColor,
);

TextStyle ktsMealPricePhoneText = TextStyle(
  fontSize: 14.sp,
  color: kcFontColor,
);

TextStyle ktsMealButtonText = TextStyle(
  fontSize: 10.sp,
  fontWeight: FontWeight.w600,
  color: kcSecondaryDarkColor,
);

TextStyle ktsMealButtonPhoneText = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: kcSecondaryDarkColor,
);

TextStyle ktsQuantityText = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: kcFontColor,
);

TextStyle ktsQuantityPhoneText = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  color: kcFontColor,
);

TextStyle ktsCatNameText = TextStyle(
  fontSize: 22.sp,
  fontWeight: FontWeight.w600,
  color: kcFontColor,
);

TextStyle ktsCartTitleText = TextStyle(
  fontSize: 12.sp,
  color: kcFontColor,
);

TextStyle ktsCartTitlePhoneText = TextStyle(
  fontSize: 14.sp,
  color: kcFontColor,
);

TextStyle ktsCartMealText = TextStyle(
  fontSize: 10.sp,
  color: kcFontColor,
);

TextStyle ktsCartMealPhoneText = TextStyle(
  fontSize: 12.sp,
  color: kcFontColor,
);

TextStyle ktsCartMealPriceText = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: kcFontColor,
);

TextStyle ktsCartMealPricePhoneText = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
  color: kcFontColor,
);

// =========== Horizontal/Vertical Space Styles ============ //

// Horizontal Spacing: Use const when there is not flutter_screenutil package
Widget horizontalSpaceTiny = SizedBox(width: 5.w);
Widget horizontalSpaceSmall = SizedBox(width: 10.w);
Widget horizontalSpaceRegular = SizedBox(width: 18.w);
Widget horizontalSpaceMedium = SizedBox(width: 25.w);
Widget horizontalSpaceLarge = SizedBox(width: 50.w);

// Vertical Spacing
Widget verticalSpaceTiny = SizedBox(height: 5.h);
Widget verticalSpaceSmall = SizedBox(height: 10.h);
Widget verticalSpaceRegular = SizedBox(height: 18.h);
Widget verticalSpaceMedium = SizedBox(height: 25.h);
Widget verticalSpaceLarge = SizedBox(height: 50.h);

// =========== Screen Size Helpers ============ //

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

// =========== Radiuses ============ //

final kbr5 = BorderRadius.circular(5.0);
final kbr10 = BorderRadius.circular(10.0);
final kbr12 = BorderRadius.circular(12.0);
final kbr15 = BorderRadius.circular(15.0);
final kbr20 = BorderRadius.circular(20.0);
final kbr50 = BorderRadius.circular(50.0);
