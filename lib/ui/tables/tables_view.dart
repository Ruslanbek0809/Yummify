import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../generated/locale_keys.g.dart';
import '../../shared/shared.dart';
import '../../widgets/widgets.dart';
import 'tables_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TablesView extends StatelessWidget {
  const TablesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TablesViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kcSecondaryDarkColor,
            elevation: 0.5,
            centerTitle: true,
            title: Text(
              LocaleKeys.tables,
              style: ktsCartTitleText,
            ).tr(),
          ),
          body: model.isBusy
              ? const Center(child: LoadingWidget())
              : GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h, //spaceTopBottom
                    crossAxisSpacing: 20.w, //spaceLeftRight
                    childAspectRatio:
                        getDeviceType() == Constants.phone ? 1 / 0.85 : 1 / 0.8,
                  ),
                  itemCount: model.tables.length,
                  itemBuilder: (context, pos) =>
                      LayoutBuilder(builder: (context, constraints) {
                    return GestureDetector(
                      onTap: () => model.addTableToHive(model.tables[pos]),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kcSecondaryDarkColor,
                          borderRadius: kbr50,
                        ),
                        width: constraints.maxWidth,
                        child: Column(
                          children: [
                            model.tables[pos].id == model.selectedHiveTable.id
                                ? Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          model.tables[pos].name ?? '',
                                          style: ktsCartMealPriceText,
                                        ),
                                        SizedBox(width: 5.w),
                                        const Icon(
                                          Icons.check,
                                          color: kcFontColor,
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      model.tables[pos].name ?? '',
                                      style: ktsCartMealPriceText,
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 15.w,
                              ),
                              child: SvgPicture.asset(
                                'assets/table.svg',
                                color: kcFontColor,
                                width: constraints.maxWidth / 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
        );
      },
      viewModelBuilder: () => TablesViewModel(),
    );
  }
}
