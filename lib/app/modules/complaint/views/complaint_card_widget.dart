import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:wifi_complaint/app/global.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/ui_helpers.dart';
import '/models/complaint_model.dart';
import '/services/database.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ComplaintCardWidget extends StatelessWidget {
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
                    await Database().updateComplaint(
                        complaint,
                        complaint.status != 'Resolved'
                            ? 'Resolved'
                            : 'Unresolvded');
                    await showSnackbar(
                        'Complaint Marked As ${complaint.status != 'Resolved' ? 'Resolved' : 'Unresolvded'}',
                        complaint.status != 'Resolved'
                            ? Status.success
                            : Status.failed);
                  }),
            ]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Text(
                  'By ${complaint.name ?? ''}',
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
                verticalSpaceSmall,
                Text(
                  'Status - ${complaint.status ?? ''}',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      height: 1.4,
                      fontSize: 16.sp),
                ),
                verticalSpaceSmall,
                const Divider(),
                verticalSpaceSmall,
                Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: AppColors.greenColor,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      DateFormat('dd-MM-yyyy, hh:mm a')
                          .format((complaint.createdAt as Timestamp).toDate()),
                      style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.4,
                          color: AppColors.blackColor),
                    )
                  ],
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
