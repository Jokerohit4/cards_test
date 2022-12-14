// coverage:ignore-file

import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  //color hex codes
  static const int blackColor = 0xFF414141;
  static const int greyColor = 0xFF9A9A9A;
  static const int darkGrey = 0xFF9A9A9A;
  static const int darkBlue = 0xFF2B3681;
  static const int lightBlue = 0xFF007AFE;
  static const int white = 0xFFFFFFFF;
  static const int pitchBlack = 0xFF0000001a;

  //colors to be used
  static const Color backgroundColor = Color(white);
  static const Color primaryColor = Color(blackColor);
  static const Color secondaryColor = Color(greyColor);
  static const Color inactiveIconColor = Color(darkGrey);
  static const Color supportingColor = Color(darkBlue);
  static const Color highlightingColor = Color(lightBlue);
  static const Color shadow = Color(pitchBlack);
}
