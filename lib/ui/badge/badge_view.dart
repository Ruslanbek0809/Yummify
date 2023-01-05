import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../shared/shared.dart';
import 'badge_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BadgeViewModel>.reactive(
      builder: (context, model, child) {
        return Padding(
          padding: EdgeInsets.only(bottom: 5.h, right: 5.w),
          child: Badge(
            showBadge: model.cartMeals.isNotEmpty,
            badgeColor: kcFontColor,
            shape: BadgeShape.circle,
            badgeContent: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                model.cartMeals.length.toString(),
                style: const TextStyle(color: kcSecondaryDarkColor),
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: kcFontColor,
              onPressed: model.navToCartView,
              tooltip: 'cart',
              child: const Icon(
                Icons.shopping_basket,
                color: kcSecondaryDarkColor,
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => BadgeViewModel(),
    );
  }
}
