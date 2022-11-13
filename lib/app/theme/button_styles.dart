// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'app_colors.dart';

TextButtonThemeData buttonStyleOne = TextButtonThemeData(
    style: ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h)),
  minimumSize: MaterialStateProperty.all<Size>(
    Size(150.w, 45.h),
  ),
  backgroundColor: MaterialStateProperty.all<Color?>(AppColors.primaryColor),
  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
      side: BorderSide(color: AppColors.primaryColor!, width: 2))),
));
TextButtonThemeData buttonStyleTwo = TextButtonThemeData(
    style: ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h)),
  minimumSize: MaterialStateProperty.all<Size>(
    Size(150.w, 45.h),
  ),
  backgroundColor: MaterialStateProperty.all<Color?>(AppColors.whiteColor),
  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
      side: BorderSide(color: AppColors.primaryColor!, width: 2))),
));
