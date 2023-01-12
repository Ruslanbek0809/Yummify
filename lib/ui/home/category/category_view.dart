import 'package:flutter/material.dart';
import 'package:yummify/widgets/widgets.dart';
import '../../../models/models.dart';
import 'package:stacked/stacked.dart';
import '../../../shared/shared.dart';
import '../../badge/badge_view.dart';
import '../meal/meal_view.dart';
import 'category_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryView({required this.categoryModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      viewModelBuilder: () => CategoryViewModel(categoryModel),
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButton: const BadgeView(),
          body: Column(
            children: [
              //------------------ CATEGORY IMAGE ---------------------//
              Stack(
                children: [
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
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      child: YummifyImage(
                        image: categoryModel.categoryImage!,
                        phImage: 'assets/ph_category_slider.png',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    top: 0.1.sw,
                    child: Material(
                      shape: const CircleBorder(),
                      color: kcSecondaryDarkColor,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: kcFontColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text(
                  categoryModel.name!,
                  style: ktsCatNameText,
                ),
              ),
              model.isBusy
                  ? const Expanded(child: Center(child: LoadingWidget()))
                  : Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.fromLTRB(16.w, 5.h, 16.w, 10.h),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h, //spaceTopBottom
                          crossAxisSpacing: 12.w, //spaceLeftRight
                          childAspectRatio: getDeviceType() == Constants.phone
                              ? 1 / 1.675
                              : 1 / 1.5,
                        ),
                        itemCount: model.categoryMeals.length,
                        itemBuilder: (context, pos) => MealView(
                          meal: model.categoryMeals[pos],
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
