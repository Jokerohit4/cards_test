import 'package:cards_test/themes/color_value.dart';
import 'package:flutter/material.dart';

/// A list of styles used all over the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class Styles {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Circular Std',
    textTheme: const TextTheme(),
    primaryColor: ColorsValue.primaryColor,
    backgroundColor: ColorsValue.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsValue.highlightingColor,
      unselectedItemColor: ColorsValue.secondaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 3,
    ),
  );
  static TextStyle textButtonStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsValue.secondaryColor,
  );
}
