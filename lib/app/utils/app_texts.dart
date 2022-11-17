// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '/app/theme/app_colors.dart';
import '/app/theme/fonts.dart';

class LoginPageHeadingText extends Text {
  LoginPageHeadingText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 36.sp,
            height: 1.5,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class LoginPageSubHeadingText extends Text {
  LoginPageSubHeadingText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 18.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SignupButtonText extends Text {
  SignupButtonText(String data, {super.key})
      : super(
          data.toUpperCase(),
          style: TextStyle(color: AppColors.primaryColor),
        );
}

class DialogButtonText extends Text {
  DialogButtonText(String data, {super.key})
      : super(
          data.toUpperCase(),
          style: TextStyle(color: AppColors.primaryColor, height: 1),
        );
}

class ProfileUpdateButtonText extends Text {
  ProfileUpdateButtonText(String data, {super.key})
      : super(
          data.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              height: 2,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500),
        );
}

class AlreadyHaveAccountText extends Text {
  AlreadyHaveAccountText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            decoration: TextDecoration.underline,
            fontSize: 16.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SkipToHomeLabelText extends Text {
  SkipToHomeLabelText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.redColor,
            fontFamily: robotoBold,
            fontSize: 16.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class BluetoothDeviceHeadingText extends Text {
  BluetoothDeviceHeadingText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            height: 1,
            fontSize: 18.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class BluetoothDeviceIdText extends Text {
  BluetoothDeviceIdText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.greyColor,
            fontFamily: robotoBold,
            fontSize: 16.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class AppBarTitleText extends Text {
  AppBarTitleText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 18.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class NavigationMenuText extends Text {
  NavigationMenuText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
        );
}

class NavigationDescriptionText extends Text {
  NavigationDescriptionText(String data, {super.key})
      : super(
          data,
          style:
              TextStyle(fontSize: 13.sp, color: AppColors.greyColor, height: 2),
        );
}

class ProfileUserNameText extends Text {
  ProfileUserNameText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor),
        );
}

class AppVersionTextText extends Text {
  AppVersionTextText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primaryColor,
              fontFamily: robotoBold,
              fontWeight: FontWeight.w500),
        );
}

class AboutHeadingText extends Text {
  AboutHeadingText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class AboutDescriptionText extends Text {
  AboutDescriptionText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 14.sp,
            height: 2,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class TabBarText extends Text {
  TabBarText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoMedium,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class DropDownItemLabel extends Text {
  DropDownItemLabel(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SubDropDownItemLabel extends Text {
  SubDropDownItemLabel(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

// Motor Settings
class CardHeadingText extends Text {
  CardHeadingText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class CardButtonText extends Text {
  CardButtonText(String data, {super.key})
      : super(
          data.toUpperCase(),
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w500),
        );
}

// Motor Settings
class HelpHeadingText extends Text {
  HelpHeadingText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SmallCardHeadingText extends Text {
  SmallCardHeadingText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontFamily: robotoBold,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            height: 1,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

// Motor Settings
class HelpDescriptionText extends Text {
  HelpDescriptionText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoBold,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class NoDataHeadingText extends Text {
  NoDataHeadingText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoMedium,
            height: 1.2,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

// Motor Settings
class NoDataBodyText extends Text {
  NoDataBodyText(String data, {super.key})
      : super(
          data,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoMedium,
            height: 1.5,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SettingsButtonText extends Text {
  SettingsButtonText(String data, {super.key})
      : super(
          data.toUpperCase(),
          style: TextStyle(
            color: AppColors.primaryColor,
            fontFamily: robotoMedium,
            height: 1,
            fontSize: 14.sp,
            fontFeatures: const [FontFeature.proportionalFigures()],
          ),
        );
}

class SpeedoMeterText extends Text {
  SpeedoMeterText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              height: 1,
              color: AppColors.primaryColor),
        );
}

class SpeedoMeterSubText extends Text {
  SpeedoMeterSubText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.4,
              color: AppColors.primaryColor),
        );
}

class GaugeAnnotationTitleText extends Text {
  GaugeAnnotationTitleText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 12.sp, height: 1.1, color: AppColors.primaryColor),
        );
}

class GaugeAnnotationValueText extends Text {
  GaugeAnnotationValueText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: AppColors.primaryColor),
        );
}

class GaugeAnnotationTwoTitleText extends Text {
  GaugeAnnotationTwoTitleText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 14.sp, height: 1.5, color: AppColors.primaryColor),
        );
}

class GaugeAnnotationTwoValueText extends Text {
  GaugeAnnotationTwoValueText(String data, {super.key})
      : super(
          data,
          style: TextStyle(
              fontSize: 10.sp, height: 1.5, color: AppColors.primaryColor),
        );
}
