import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';
import '../badge/badge_view.dart';
import 'home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.setInitialLang(context),
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButton: const BadgeView(),
          body: Column(
            children: [
              //------------------ MAIN IMAGE ---------------------//
              Container(
                height: 0.3.sw,
                width: 1.sw,
                decoration: const BoxDecoration(
                  color: kcFontColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                padding: EdgeInsets.only(bottom: 2.h),
                margin: EdgeInsets.only(bottom: 15.h),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      child: YummifyImage(
                        image: 'assets/coffee_nostra_inside.png',
                        height: 0.3.sw,
                        width: 1.sw,
                      ),
                    ),
                    //------------------ LANGUAGE ---------------------//
                    Positioned(
                      top: 22.h,
                      right: 10.w,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,

                          /// HINT TEXT when dropdown is empty
                          hint: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.w),
                                child: SvgPicture.asset(
                                  'assets/globe.svg',
                                  color: kcFontColor,
                                  width: getDeviceType() == Constants.phone
                                      ? 14.sp
                                      : 10.sp,
                                ),
                              ),
                              Text(
                                model.selectedLang!,
                                style: ktsMealText,
                              ).tr(),
                            ],
                          ),

                          /// ICON in the right
                          iconSize: 0,
                          icon: const SizedBox(),

                          /// BUTTON is selected lang style
                          buttonHeight: 40,
                          buttonWidth: 115,
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 4.h),
                          buttonDecoration: BoxDecoration(
                            borderRadius: kbr10,
                            color: kcSecondaryDarkColor,
                          ),
                          items: appLangs
                              .map((lang) => DropdownMenuItem<String>(
                                    value: lang,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: getDeviceType() ==
                                                      Constants.phone
                                                  ? 8.w
                                                  : 3.w),
                                          child: SvgPicture.asset(
                                            'assets/globe.svg',
                                            color: kcFontColor,
                                            width: getDeviceType() ==
                                                    Constants.phone
                                                ? 14.sp
                                                : 10.sp,
                                          ),
                                        ),
                                        Text(
                                          lang,
                                          style:
                                              getDeviceType() == Constants.phone
                                                  ? ktsMealPhoneText
                                                  : ktsMealText,
                                        ).tr(),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          value: model.selectedLang,
                          onChanged: (selectedLangValue) async {
                            /// if selectedLangValue is NOT turkmen
                            if (model.selectedLang != selectedLangValue &&
                                selectedLangValue == appLangs[0]) {
                              await context.setLocale(context
                                  .supportedLocales[0]); // ASSIGNS turkmen lang
                              await model.setLocale(
                                  context.supportedLocales[0].toString());
                              await model.reinitializeDio();
                              await model.navToHomeByRemovingAll();
                            }

                            /// if selectedLangValue is NOT russian
                            if (model.selectedLang != selectedLangValue &&
                                selectedLangValue == appLangs[1]) {
                              await context.setLocale(context
                                  .supportedLocales[1]); // ASSIGNS russian lang
                              await model.setLocale(
                                  context.supportedLocales[1].toString());
                              await model.reinitializeDio();
                              await model.navToHomeByRemovingAll();
                            }
                          },

                          /// Below DROPDOWN style
                          itemPadding: EdgeInsets.only(left: 8.w),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: kbr10,
                            color: kcSecondaryDarkColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //------------------ HOME TABLE, INFO TEXT ---------------------//
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/logo.svg',
                          color: kcFontColor,
                          height: getDeviceType() == Constants.phone
                              ? 0.075.sh
                              : 0.1.sh,
                        ),
                        SvgPicture.asset(
                          'assets/logo_name.svg',
                          color: kcFontColor,
                          height: getDeviceType() == Constants.phone
                              ? 0.05.sh
                              : 0.075.sh,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async => await model.navToTablesView(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/table_logo.svg',
                                  color: kcFontColor,
                                  width: getDeviceType() == Constants.phone
                                      ? 16.w
                                      : 12.sp,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w, top: 6.h),
                                  child: Text(
                                    model.selectedHiveTable.name!,
                                    style: getDeviceType() == Constants.phone
                                        ? ktsCatText
                                        : ktsInfoText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/instagram.svg',
                                color: kcFontColor,
                                width: getDeviceType() == Constants.phone
                                    ? 16.w
                                    : 12.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'restaurant_ig_page',
                                  style: getDeviceType() == Constants.phone
                                      ? ktsCatText
                                      : ktsInfoText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/imo.svg',
                                width: getDeviceType() == Constants.phone
                                    ? 16.w
                                    : 12.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  'imo_page',
                                  style: getDeviceType() == Constants.phone
                                      ? ktsCatText
                                      : ktsInfoText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // --------------- CATEGORIES -------------- //
              model.isBusy
                  ? const Expanded(child: Center(child: LoadingWidget()))
                  : Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            GridView.builder(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 15.h),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15.h, //spaceTopBottom
                                crossAxisSpacing: 15.w, //spaceLeftRight
                                childAspectRatio: 1 / 0.8,
                              ),
                              itemCount: model.categories.length,
                              itemBuilder: (context, pos) => LayoutBuilder(
                                  builder: (context, constraints) {
                                return GestureDetector(
                                  onTap: () => model.navToCategoryMealsView(
                                      model.categories[pos]),
                                  child: Container(
                                    width: constraints.maxWidth,
                                    decoration: BoxDecoration(
                                      color: kcSecondaryDarkColor,
                                      borderRadius: kbr12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5.h,
                                            horizontal: 7.w,
                                          ),
                                          child: Text(
                                            model.categories[pos].name ?? '',
                                            maxLines: 1,
                                            style: getDeviceType() ==
                                                    Constants.phone
                                                ? ktsCatPhoneText
                                                : ktsCatText,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: YummifyImage(
                                            image: model.categories[pos].image!,
                                            borderRadius: 12.0,
                                            width: constraints.maxWidth,
                                            phImage: 'assets/ph_category.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
