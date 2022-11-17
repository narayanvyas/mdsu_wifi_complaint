import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/network_engineer/views/user_card_widget.dart';

import '../../../theme/app_colors.dart';
import '../controllers/network_engineer_controller.dart';

class NetworkEngineerView extends GetView<NetworkEngineerController> {
  const NetworkEngineerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Engineers'),
        centerTitle: true,
      ),
      body: Obx(() => controller.engineers.isEmpty
          ? Center(
              child: Text(
                'No Network Engineers Created Yet',
                style: TextStyle(fontSize: 18.sp, color: AppColors.blackColor),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              itemCount: controller.engineers.length,
              itemBuilder: (context, index) =>
                  UserCardWidget(user: controller.engineers[index]))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blackColor,
        onPressed: () async {
          await controller.showNetworkEngineerDialog(context, false);
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
