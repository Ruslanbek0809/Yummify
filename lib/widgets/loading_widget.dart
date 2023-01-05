import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../shared/shared.dart';

class LoadingWidget extends StatelessWidget {
  final double? width;
  const LoadingWidget({Key? key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(
      size: width ?? 0.15.sw,
      lineWidth: 4.0,
      itemCount: 5,
      color: kcFontColor,
    );
  }
}
