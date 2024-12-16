//======= DART IMPORTS: =======//
import 'dart:math';

//======= PACKAGE IMPORTS =======//
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';

//======= FLUTTER IMPORTS: =======//
import 'package:flutter/material.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';

Widget cacheImage({
  required String url,
  double? height,
  double? width,
  BoxFit? fit,
  double? radius,
  bool? animate = true,
}) {
  if (url.isNotEmpty) {
    if (url.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: url,
        height: height ?? 50,
        width: width ?? 50,
        fit: fit ?? BoxFit.cover,
        errorWidget: (context, url, error) {
          return Container(
            height: height ?? 50,
            width: width ?? 50,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.circular(defaultRadius),
              backgroundColor: lightColors[Random().nextInt(lightColors.length)],
            ),
          );
        },
      );
    } else {
      return Image.asset(
        url,
        height: height ?? 50,
        width: width ?? 50,
        fit: fit ?? BoxFit.cover,
      ).cornerRadiusWithClipRRect(radius ?? AppRadius.radius8);
    }
  } else {
    return Container(
      height: height ?? 50,
      width: width ?? 50,
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(defaultRadius),
        backgroundColor: lightColors[Random().nextInt(lightColors.length)],
      ),
    );
  }
}
