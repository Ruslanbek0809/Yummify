import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/shared.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final Widget child;
  const CustomModalBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          // --------------- CUSTOM BOTTOM SHEET MODAL WIDGET -------------- //
          Positioned(
            top: 0.h,
            child: Container(
              height: 5,
              width: 48,
              transform: Matrix4.translationValues(0.0, -10.h, 0.0),
              decoration: BoxDecoration(
                color: kcWhiteColor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
