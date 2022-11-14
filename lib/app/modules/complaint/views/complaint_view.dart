import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/modules/complaint/views/complaint_success_view.dart';
import '/app/modules/complaint/views/troubleshooting_view.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/ui_helpers.dart';

import '../../../theme/form_field_styles.dart';
import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  final bool isDepartmentalComplaint;
  const ComplaintView({required this.isDepartmentalComplaint, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Complaint'),
        centerTitle: true,
      ),
      body: Obx(() => controller.currentTroubleshootingIndex.value < 2
          ? const TroubleshootingView()
          : controller.currentTroubleshootingIndex.value == 3
              ? const ComplaintSuccessView()
              : Center(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                    shrinkWrap: true,
                    children: [
                      Image.asset(
                        'assets/images/complaint_form.png',
                        height: 150.h,
                      ),
                      verticalSpaceLarge,
                      if (isDepartmentalComplaint)
                        SizedBox(
                          child: DropdownButtonFormField<String>(
                            decoration: customTextFormFieldDecoration.copyWith(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.blackColor!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.blackColor!),
                              ),
                            ),
                            value: controller.selectedDepartment.value,
                            onChanged: (String? value) {
                              controller.updateDropdown(value ?? '');
                            },
                            dropdownColor: AppColors.whiteColor,
                            items:
                                controller.departmentList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: screenWidth(context) - 110.w,
                                  child: Text(
                                    value,
                                    style: const TextStyle(height: 1.5),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      if (isDepartmentalComplaint) verticalSpaceMedium,
                      TextField(
                        controller: controller.nameController,
                        decoration: customTextFormFieldDecoration.copyWith(
                            labelText: 'Name', hintText: 'Eg. Aradhya'),
                      ),
                      verticalSpaceMedium,
                      TextField(
                        controller: controller.emailController,
                        decoration: customTextFormFieldDecoration.copyWith(
                            labelText: 'Email',
                            hintText: 'Eg. contact@mdsu.ac.in'),
                      ),
                      verticalSpaceMedium,
                      TextField(
                        controller: controller.complaintController,
                        maxLines: 5,
                        decoration: customTextFormFieldDecoration.copyWith(
                            labelText: 'Complaint',
                            hintText: 'Eg. WiFi is not working'),
                      ),
                      verticalSpaceMedium,
                      TextButton(
                        onPressed: () async =>
                            await controller.submitComplaint(),
                        child: Text(
                          'Submit Complaint',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
