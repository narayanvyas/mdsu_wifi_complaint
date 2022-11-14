import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';
import '/app/modules/complaint/views/complaint_card_widget.dart';
import '/app/theme/app_colors.dart';

class ComplaintListView extends GetView<ComplaintController> {
  const ComplaintListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Complaints'),
        centerTitle: true,
      ),
      body: Obx(() => controller.complaints.isEmpty
          ? Center(
              child: Text(
                'No Complaints Made Yet',
                style: TextStyle(fontSize: 18.sp, color: AppColors.blackColor),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              itemCount: controller.complaints.length,
              itemBuilder: (context, index) => ComplaintCardWidget(
                  complaint: controller.complaints[index]))),
    );
  }
}
