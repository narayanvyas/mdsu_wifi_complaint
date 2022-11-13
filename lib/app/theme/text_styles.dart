// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';
import 'font_sizes.dart';
import 'fonts.dart';

// Buttons

TextStyle inkwellButtonTextType =
    TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500);
TextStyle lightButtonTextStyle =
    TextStyle(color: AppColors.whiteColor, height: 1);

// Text Where Dark BG is Used
TextStyle darkTextStyleTwo = TextStyle(
  color: AppColors.primaryColor,
);

// Headings

TextStyle headlineTwoStyle = TextStyle(
  color: AppColors.whiteColor,
  fontFamily: robotoRegular,
  height: 1.2,
  fontSize: headingTwoSize,
);
TextStyle headlineFourStyle = TextStyle(
  color: AppColors.primaryColor,
  fontFamily: robotoRegular,
  height: 1.5,
  fontSize: headingFourSize,
);
TextStyle headingFiveStyle = TextStyle(
    color: AppColors.whiteColor,
    fontFamily: robotoRegular,
    height: 1.5,
    fontSize: headingFiveSize);
TextStyle headingTextStyleOne = TextStyle(
  color: AppColors.primaryColor,
  fontFamily: robotoRegular,
  height: 1.5,
);

TextStyle headlineTwoDarkStyle = TextStyle(
  color: AppColors.primaryColor,
  fontFamily: robotoRegular,
  fontSize: 18,
);

// Body
TextStyle bodyStyle = TextStyle(
  color: AppColors.primaryColor,
  fontFamily: robotoBold,
  height: 3,
  fontSize: bodySizeTwo,
);
TextStyle darkBodyStyle = TextStyle(
  color: AppColors.primaryColor,
  fontFamily: robotoBold,
  height: 3,
  fontSize: bodySizeTwo,
);

// Text Form Fields
TextStyle outlineInputTextFormFieldLabelStyle = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: robotoRegular,
    fontSize: headingFourSize,
    height: 1,
    decoration: TextDecoration.none);
TextStyle outlineInputTextFormFieldHintStyle = TextStyle(
  color: AppColors.primaryColor,
  height: 1,
);
