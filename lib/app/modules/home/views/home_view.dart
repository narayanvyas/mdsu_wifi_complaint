import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:wifi_complaint/app/modules/complaint/controllers/complaint_controller.dart';
import 'package:wifi_complaint/app/modules/complaint/views/complaint_view.dart';
import 'package:wifi_complaint/app/theme/app_colors.dart';
import 'package:wifi_complaint/app/theme/ui_helpers.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MDSU WiFi Complaint Portal'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
            shrinkWrap: true,
            children: [
              Card(
                child: ListTile(
                  onTap: () {
                    Get.find<ComplaintController>()
                        .currentTroubleshootingIndex
                        .value = 0;
                    Get.to(const ComplaintView(isDepartmentalComplaint: false));
                  },
                  title: Column(
                    children: [
                      Image.asset(
                        'assets/images/student_image.png',
                        height: 150.h,
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: AppColors.redColor,
                          ),
                          horizontalSpaceSmall,
                          const Text(
                            'Student',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_right_alt_outlined,
                            color: AppColors.redColor,
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              Card(
                child: ListTile(
                  onTap: () {
                    Get.find<ComplaintController>()
                        .currentTroubleshootingIndex
                        .value = 0;
                    Get.to(const ComplaintView(isDepartmentalComplaint: true));
                  },
                  title: Column(
                    children: [
                      Image.asset(
                        'assets/images/department.png',
                        height: 150.h,
                      ),
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: AppColors.redColor,
                          ),
                          horizontalSpaceSmall,
                          const Text(
                            'Department',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_right_alt_outlined,
                            color: AppColors.redColor,
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
