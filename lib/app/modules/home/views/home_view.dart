import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
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
        title: const Text('WiFi Complaint'),
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
                    Get.to(ComplaintView(isDepartmentalComplaint: false));
                  },
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Student'),
                  trailing: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Card(
                child: ListTile(
                  onTap: () {
                    Get.to(ComplaintView(isDepartmentalComplaint: true));
                  },
                  leading: const Icon(Icons.crop_original_outlined),
                  title: const Text('Department'),
                  trailing: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppColors.blueColor,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
