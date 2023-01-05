import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class CustomTextChildButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Function onPressed;
  const CustomTextChildButton({
    Key? key,
    required this.child,
    this.color = kcFontColor,
    this.padding,
    this.borderRadius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        primary: kcSecondaryLightColor, // ripple effect color
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? radius15,
        ),
        padding: padding ?? const EdgeInsets.all(0.0),
        // primary: color,
        // onSurface: color,
        // shadowColor: color,
        // minimumSize: Size(width!, height!),
      ),
      onPressed: onPressed as void Function(),
      child: child,
    );
  }
}
