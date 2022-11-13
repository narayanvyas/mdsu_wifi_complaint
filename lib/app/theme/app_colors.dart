// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/app/global.dart';

Color? getColorFromHex(String? hexColor, Color? defaultColor) {
  String? currentHexColor =
      hexColor == null ? '' : hexColor.replaceAll('#', '');
  if (currentHexColor.length == 6) {
    currentHexColor = 'FF$currentHexColor';
    return Color(int.parse('0x$currentHexColor'));
  }
  if (currentHexColor.length == 8) {
    return Color(int.parse('0x$currentHexColor'));
  }
  return defaultColor;
}

class AppColors {
  AppColors();
  // Global Colors
  static Color? primaryColor = isDarkMode() ? Colors.white : Color(0xFF2C2C2C);
  static Color? primaryBgColor =
      isDarkMode() ? Color(0xFF2C2C2C) : Colors.white;
  static Color? accentColor = const Color(0xFF1D1D1D);
  static Color? greyColor = const Color(0xFF9F9F9F);
  static Color? darkBgTextColor = Colors.black;
  static Color? circularProgressIndicatorColor = AppColors.primaryColor;
  static Color? circularProgressIndicatorDarkColor = const Color(0xFFFFFFFF);
  static Color? circularProgressIndicatorInButtonColor =
      isDarkMode() ? Colors.white : Colors.black;
  static Color? blackColor = Colors.black;
  static Color? blackTwoColor = Colors.black;
  static Color? whiteColor = Colors.white;
  static Color? redColor = const Color(0xFFE11C1C);
  static Color? greenColor = const Color(0xFF22C316);
  static Color? blueColor = const Color(0xFF40C2F3);
  static String redHexColor = '#E11C1C';
  static String blueHexColor = '#40C2F3';
  static String greenHexColor = '#22C316';
}
