import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/network_engineer/views/network_engineer_view.dart';
import '/app/controllers/global_controller.dart';
import '/app/modules/auth/controllers/auth_controller.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';
import '/app/modules/complaint/views/complaint_list_view.dart';
import '/app/modules/complaint/views/complaint_view.dart';
import '/app/routes/app_pages.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/ui_helpers.dart';

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
              Obx(() => Get.find<GlobalController>().user.value.role == 'admin'
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(const NetworkEngineerView());
                        },
                        title: Column(
                          children: [
                            Image.asset(
                              'assets/images/network_engineer.png',
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
                                  'Manage Network Engineers',
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
                    )
                  : Container()),
              Obx(() => Get.find<GlobalController>().user.value.role == 'admin'
                  ? verticalSpaceMedium
                  : Container()),
              Obx(() => Get.find<GlobalController>().user.value.id != null
                  ? Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(const ComplaintListView());
                        },
                        title: Column(
                          children: [
                            Image.asset(
                              'assets/images/complaint.png',
                              height: 150.h,
                            ),
                            verticalSpaceMedium,
                            Row(
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  color: AppColors.redColor,
                                ),
                                horizontalSpaceSmall,
                                const Text(
                                  'View Complaints',
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
                    )
                  : Card(
                      child: ListTile(
                        onTap: () {
                          Get.find<ComplaintController>()
                              .currentTroubleshootingIndex
                              .value = 0;
                          Get.to(const ComplaintView(
                              isDepartmentalComplaint: false));
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
                    )),
              Obx(() => Get.find<GlobalController>().user.value.id != null
                  ? Container()
                  : verticalSpaceMedium),
              Obx(() => Get.find<GlobalController>().user.value.id != null
                  ? Container()
                  : Card(
                      child: ListTile(
                        onTap: () {
                          Get.find<ComplaintController>()
                              .currentTroubleshootingIndex
                              .value = 0;
                          Get.to(const ComplaintView(
                              isDepartmentalComplaint: true));
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
                    )),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Get.find<GlobalController>().user.value.id == null
                      ? TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.AUTH);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: AppColors.whiteColor),
                          ))
                      : TextButton(
                          onPressed: () async {
                            await Get.find<AuthController>().signOut();
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(color: AppColors.whiteColor),
                          ))),
                ],
              )
            ]),
      ),
    );
  }
}
