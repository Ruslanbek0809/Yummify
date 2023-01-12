import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import '../models/cart_meal_dialog_data.dart';
import '../shared/shared.dart';
import '../widgets/widgets.dart';
import 'ui/cart/cart.dart';

void setupDialog() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.removeCartMeal: (context, sheetRequest, completer) =>
        RemoveCartMealDialogView(
          request: sheetRequest,
          completer: completer,
          cartMealDialogData: sheetRequest.data,
        ),
    DialogType.clearCart: (context, sheetRequest, completer) =>
        ClearCartDialogView(
          request: sheetRequest,
          completer: completer,
          cartViewModel: sheetRequest.data,
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

//------------------ CART DIALOGS ---------------------//

class ClearCartDialogView extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final CartViewModel cartViewModel;
  const ClearCartDialogView({
    Key? key,
    required this.request,
    required this.completer,
    required this.cartViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => cartViewModel,
      disposeViewModel: false,
      builder: (context, model, child) {
        return AlertDialog(
          backgroundColor: kcSecondaryDarkColor,
          shape: RoundedRectangleBorder(borderRadius: kbr10),
          titlePadding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 8.h),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
            request.title!,
            textAlign: TextAlign.center,
          ).tr(),
          titleTextStyle: ktsCartTitleText,
          actions: <Widget>[
            CustomTextChildButton(
              color: Colors.transparent,
              onPressed: () async {
                await model.clearCart();
                completer(DialogResponse());
              },
              child: Text(
                request.secondaryButtonTitle!,
                style: ktsCartMealText,
              ).tr(),
            ),
            SizedBox(width: 42.w),
            CustomTextChildButton(
              color: Colors.transparent,
              onPressed: () async => await completer(DialogResponse()),
              child: Text(
                request.mainButtonTitle!,
                style: ktsCartMealText,
              ).tr(),
            ),
          ],
        );
      },
    );
  }
}

class RemoveCartMealDialogView extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final CartMealDialogData cartMealDialogData;
  const RemoveCartMealDialogView({
    Key? key,
    required this.request,
    required this.completer,
    required this.cartMealDialogData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => cartMealDialogData.cartViewModel,
      disposeViewModel: false,
      builder: (context, model, child) {
        return AlertDialog(
          backgroundColor: kcSecondaryDarkColor,
          shape: RoundedRectangleBorder(borderRadius: kbr10),
          titlePadding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 8.h),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
            request.title!,
            textAlign: TextAlign.center,
          ).tr(),
          titleTextStyle: ktsCartTitleText,
          actions: <Widget>[
            CustomTextChildButton(
              color: Colors.transparent,
              onPressed: () async {
                await model.updateCartMealInCart(
                  cartMealDialogData.cartMeal,
                  cartMealDialogData.cartMeal.quantity! - 1,
                );
                completer(DialogResponse());
              },
              child: Text(
                request.secondaryButtonTitle!,
                style: ktsCartMealText,
              ).tr(),
            ),
            SizedBox(width: 42.w),
            CustomTextChildButton(
              color: Colors.transparent,
              onPressed: () async => await completer(DialogResponse()),
              child: Text(
                request.mainButtonTitle!,
                style: ktsCartMealText,
              ).tr(),
            ),
          ],
        );
      },
    );
  }
}
