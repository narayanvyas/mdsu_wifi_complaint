// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/app/theme/text_styles.dart';
import 'app_colors.dart';
import 'button_styles.dart';
import 'form_field_styles.dart';

ThemeData lightThemeStyle = ThemeData(
    textTheme: TextTheme(
        headline2: headlineTwoStyle,
        headline5: headingFiveStyle,
        subtitle1: TextStyle(color: AppColors.blackColor),
        bodyText2: bodyStyle),
    textButtonTheme: buttonStyleOne,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.blackColor),
    inputDecorationTheme: outlineInputTextFormFieldStyle,
    canvasColor: AppColors.whiteColor);

ThemeData darkThemeStyle = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
        headline2: headlineTwoStyle,
        headline5: headingFiveStyle,
        subtitle1: TextStyle(color: AppColors.blackColor),
        bodyText2: bodyStyle),
    textButtonTheme: buttonStyleOne,
    appBarTheme:
        AppBarTheme(iconTheme: IconThemeData(color: AppColors.blackColor)),
    inputDecorationTheme: outlineInputTextFormFieldStyle,
    canvasColor: Colors.black54);
