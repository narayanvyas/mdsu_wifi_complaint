import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/button_styles.dart';
import '/app/theme/ui_helpers.dart';

class TroubleshootingView extends GetView<ComplaintController> {
  const TroubleshootingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() => ListView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              shrinkWrap: true,
              children: [
                Image.asset(controller.currentTroubleshootingIndex.value == 0
                    ? 'assets/images/wifi_settings.png'
                    : 'assets/images/restart_phone.png'),
                Text(
                  controller.currentTroubleshootingIndex.value == 0
                      ? 'Try to reset your WiFi Settings'
                      : 'Try Restarting Your Device',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                      fontSize: 16.sp),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.currentTroubleshootingIndex.value = 0;
                          Get.back();
                        },
                        style: buttonStyleTwo.style,
                        child: Text(
                          'Problem Solved',
                          style: TextStyle(color: AppColors.blackColor),
                        )),
                    horizontalSpaceMedium,
                    TextButton(
                        onPressed: () {
                          controller.currentTroubleshootingIndex.value++;
                        },
                        child: Text(
                          controller.currentTroubleshootingIndex.value != 1
                              ? 'Next Step'
                              : 'Raise Complaint',
                          style: TextStyle(color: AppColors.whiteColor),
                        )),
                  ],
                )
              ],
            )));
  }
}
