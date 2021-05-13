import 'package:flutter/material.dart';

import 'colors.dart';

class KTextStyle {
  //Headline
  static TextStyle headline1 = TextStyle(
    color: KColor.blackColor,
    fontSize: 96,
    fontWeight: FontWeight.normal, //light
    letterSpacing: -1.5,
  );
  static TextStyle headline2 = TextStyle(
    color: KColor.blackColor,
    fontSize: 60,
    fontWeight: FontWeight.normal, //light
    letterSpacing: -0.5,
  );
  static TextStyle headline3 = TextStyle(
    color: KColor.blackColor,
    fontSize: 48,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0,
  );
  static TextStyle headline4 = TextStyle(
    color: KColor.blackColor,
    fontSize: 34,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0.25,
  );
  static TextStyle headline5 = TextStyle(
    color: KColor.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0,
  );
  static TextStyle headline6 = TextStyle(
    color: KColor.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w600, //Medium
    letterSpacing: 0.15,
  );

  /// Subtitle
  static TextStyle subtitle1 = TextStyle(
    color: KColor.blackColorLight,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0.15,
  );
  static TextStyle subtitle2 = TextStyle(
    color: KColor.blackColorLight,
    fontSize: 14,
    fontWeight: FontWeight.w600, //Medium
    letterSpacing: 0.1,
  );

  /// Body
  static TextStyle body1 = TextStyle(
    color: KColor.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0.5,
  );
  static TextStyle body2 = TextStyle(
    color: KColor.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0.25,
  );

  /// BUTTON
  static TextStyle button = TextStyle(
    color: KColor.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w600, //Medium
    letterSpacing: 1.25,
  );

  /// Caption
  static TextStyle caption = TextStyle(
    color: KColor.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 0.4,
  );

  /// OVERLINE
  static TextStyle overline = TextStyle(
    color: KColor.blackColor,
    fontSize: 10,
    fontWeight: FontWeight.w400, // Normal
    letterSpacing: 1.5,
  );
}
