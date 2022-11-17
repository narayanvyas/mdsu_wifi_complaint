// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../theme/app_colors.dart';
import '/app/theme/font_sizes.dart';

// Project imports:


Widget defaultLoadingIndicator = Center(
  child: SizedBox(
    width: circularProgressIndicatorInButtonSize,
    height: circularProgressIndicatorInButtonSize,
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.circularProgressIndicatorColor!)),
  ),
);
Widget defaultLoadingIndicatorDark = Center(
  child: SizedBox(
    width: circularProgressIndicatorInButtonSize,
    height: circularProgressIndicatorInButtonSize,
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.circularProgressIndicatorDarkColor!)),
  ),
);
Widget loadingIndicatorInsideButtonDark = Center(
  child: SizedBox(
    width: circularProgressIndicatorInButtonSize,
    height: circularProgressIndicatorInButtonSize,
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            AppColors.circularProgressIndicatorDarkColor!)),
  ),
);
Widget loadingIndicatorInsideButton = Center(
    child: SizedBox(
  width: circularProgressIndicatorInButtonSize,
  height: circularProgressIndicatorInButtonSize,
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(
        AppColors.circularProgressIndicatorInButtonColor),
  ),
));
