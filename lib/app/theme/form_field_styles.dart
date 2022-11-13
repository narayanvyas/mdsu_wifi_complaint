// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';
import 'text_styles.dart';

InputDecorationTheme outlineInputTextFormFieldStyle = InputDecorationTheme(
  labelStyle: outlineInputTextFormFieldLabelStyle,
  hintStyle: outlineInputTextFormFieldHintStyle,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!), // Need To Change
    borderRadius: BorderRadius.circular(4),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor!.withOpacity(0.8),
    ),
    borderRadius: BorderRadius.circular(4),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor!.withOpacity(0.8),
    ),
    borderRadius: BorderRadius.circular(4),
  ),
  border: InputBorder.none,
  focusColor: Colors.black,
);

InputDecorationTheme outlineInputTextFormFieldStyleTwo = InputDecorationTheme(
  labelStyle: outlineInputTextFormFieldLabelStyle,
  hintStyle: outlineInputTextFormFieldHintStyle,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!), // Need To Change
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!),
    borderRadius: BorderRadius.circular(10),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!),
    borderRadius: BorderRadius.circular(10),
  ),
  border: InputBorder.none,
  focusColor: AppColors.primaryColor,
);

InputDecoration outlineInputTextFormFieldStyleThree = InputDecoration(
  labelStyle: outlineInputTextFormFieldLabelStyle,
  hintStyle: outlineInputTextFormFieldHintStyle,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!), // Need To Change
    borderRadius: BorderRadius.circular(4),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor!.withOpacity(0.8),
    ),
    borderRadius: BorderRadius.circular(4),
  ),
  disabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor!.withOpacity(0.8),
    ),
    borderRadius: BorderRadius.circular(4),
  ),
  border: InputBorder.none,
  focusColor: AppColors.primaryColor,
);

InputDecoration customTextFormFieldDecoration = InputDecoration(
  hintStyle: outlineInputTextFormFieldHintStyle,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!), // Need To Change
    borderRadius: BorderRadius.circular(3),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!),
    borderRadius: BorderRadius.circular(3),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor!),
    borderRadius: BorderRadius.circular(3),
  ),
  border: InputBorder.none,
  focusColor: AppColors.primaryColor,
  labelStyle: headlineFourStyle.copyWith(fontWeight: FontWeight.w400),
);

// class CustomRangeTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     if (newValue.text == '') {
//       return const TextEditingValue();
//     } else if (int.parse(newValue.text) < 1) {
//       return const TextEditingValue().copyWith(text: '1');
//     }

//     return int.parse(newValue.text) > 20
//         ? const TextEditingValue().copyWith(text: '20')
//         : newValue;
//   }
// }
