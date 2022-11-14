import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/ui_helpers.dart';

class ComplaintSuccessView extends GetView<ComplaintController> {
  const ComplaintSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
        shrinkWrap: true,
        children: [
          Image.asset(
            'assets/images/success_icon.png',
            height: 200.h,
          ),
          verticalSpaceLarge,
          Text(
            'Your complaint has been reaised successfully with Complaint ID ${controller.currentComplaintId.value}. We have sent you an email as well.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: AppColors.blackColor,
                fontSize: 16.sp),
          ),
          verticalSpaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    controller.currentTroubleshootingIndex.value == 0;
                    Get.back();
                  },
                  child: Text(
                    'Go To Home',
                    style: TextStyle(color: AppColors.whiteColor),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
