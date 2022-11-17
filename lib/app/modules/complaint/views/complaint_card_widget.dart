import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import '/app/controllers/dialog_controller.dart';
import '/app/global.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/ui_helpers.dart';
import '/models/complaint_model.dart';
import 'package:get/get.dart';
import '/services/database.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ComplaintCardWidget extends GetView<ComplaintController> {
  final ComplaintModel complaint;
  const ComplaintCardWidget({required this.complaint, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Row(children: [
              Text(
                'ID - ${complaint.id ?? ''}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              if (complaint.latitude != 0.0 && complaint.longitude != 0.0)
                IconButton(
                    icon: const Icon(
                      Icons.map_outlined,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () async {
                      final availableMaps = await MapLauncher.installedMaps;
                      await availableMaps.first.showMarker(
                        coords: Coords(complaint.latitude ?? 0.0,
                            complaint.longitude ?? 0.0),
                        title: "MDSU Complaint Location",
                      );
                    }),
              IconButton(
                  icon: complaint.status != 'Resolved'
                      ? Icon(
                          Icons.check_rounded,
                          color: AppColors.greenColor,
                        )
                      : Icon(
                          Icons.cancel_outlined,
                          color: AppColors.redColor,
                        ),
                  onPressed: () async {
                    if (complaint.status != 'Resolved') {
                      await controller.showResolveComplaintDialog(
                          complaint, context);
                    } else {
                      await Get.find<DialogController>().showDialog(
                          context: context,
                          title: 'Unresolve Complaint',
                          message:
                              'Are you sure you want to mark this complaint as unresolved?',
                          action: () async {
                            complaint.status = 'Unresolved';
                            await Database().updateComplaint(complaint);
                            Get.back();
                            await showSnackbar(
                                'Complaint Marked As Unresolvded',
                                Status.failed);
                          },
                          submitButtonText: 'Yes',
                          isShowCancelButton: true);
                    }
                  }),
            ]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1.h,
                ),
                Text(
                  'By ${complaint.name ?? ''} on ${DateFormat('dd-MM-yyyy, hh:mm a').format((complaint.createdAt as Timestamp).toDate())}',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackColor!.withOpacity(0.8)),
                ),
                verticalSpaceSmall,
                Text(
                  'Complaint - ${complaint.complaint ?? ''}',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      height: 1.4,
                      fontSize: 16.sp),
                ),
                if (complaint.status == 'Resolved') verticalSpaceSmall,
                if (complaint.status == 'Resolved') const Divider(),
                if (complaint.status == 'Resolved') verticalSpaceSmall,
                if (complaint.status == 'Resolved')
                  SizedBox(
                    width: screenWidth(context) - 100.w,
                    child: Text(
                      'Complaint resolved on ${complaint.resolvedAt == null ? 'unknown time' : DateFormat('dd-MM-yyyy, hh:mm a').format((complaint.resolvedAt as Timestamp).toDate())} by ${complaint.resolvedByUserName ?? 'Admin'}.',
                      style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.4,
                          color: AppColors.blackColor),
                    ),
                  ),
                if (complaint.status == 'Resolved') verticalSpaceSmall,
                if (complaint.status == 'Resolved')
                  SizedBox(
                    width: screenWidth(context) - 100.w,
                    child: Text(
                      'Remarks - ${complaint.remarks ?? 'None'}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.4,
                          color: AppColors.blackColor),
                    ),
                  ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
        verticalSpaceSmall,
      ],
    );
  }
}
