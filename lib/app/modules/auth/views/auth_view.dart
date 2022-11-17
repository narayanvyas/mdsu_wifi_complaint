import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/theme/app_colors.dart';

import '../../../theme/form_field_styles.dart';
import '../../../theme/text_styles.dart';
import '../../../theme/ui_helpers.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          children: [
            Image.asset(
              'assets/images/login.png',
              height: 150.h,
            ),
            verticalSpaceLarge,
            TextField(
              controller: controller.loginEmailController,
              style:
                  headingTextStyleOne.copyWith(color: AppColors.primaryColor),
              decoration: customTextFormFieldDecoration.copyWith(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor!), // Need To Change
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor!),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor!),
                ),
              ),
            ),
            verticalSpaceLarge,
            TextField(
              controller: controller.loginPasswordController,
              style:
                  headingTextStyleOne.copyWith(color: AppColors.primaryColor),
              decoration: customTextFormFieldDecoration.copyWith(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColors.primaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor!), // Need To Change
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor!),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor!),
                ),
              ),
            ),
            verticalSpaceLarge,
            Obx(() => TextButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          await controller.performUserLogin();
                        },
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                )),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
