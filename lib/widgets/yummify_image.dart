import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class YummifyImage extends StatelessWidget {
  final String image;
  final String phImage;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final AlignmentGeometry alignment;

  const YummifyImage({
    Key? key,
    required this.image,
    this.phImage = 'assets/logo.png',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!(image.contains('http'))) {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Image.asset(
          image,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit,
        width: width,
        height: height,
        placeholder: (context, url) => Image.asset(
          phImage,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
        ),
        errorWidget: (context, url, error) => Image.asset(
          phImage,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
        ),
      ),
    );
  }
}
