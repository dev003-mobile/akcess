import 'package:flutter/material.dart';

class AppStyleDesign {
  static TextStyle fontStyleInter({
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
    FontWeight? fontWeight,
    Color? backgroundColor,
    TextDecoration? decoration,
    TextOverflow? textOverflow = TextOverflow.ellipsis,
  }) => TextStyle(
    color: color,
    height: height,
    fontSize: size,
    fontFamily: "Inter",
    fontWeight: fontWeight,
    decoration: decoration,
    letterSpacing: letterSpacing,
    backgroundColor: backgroundColor,
    overflow: textOverflow,
  );
}