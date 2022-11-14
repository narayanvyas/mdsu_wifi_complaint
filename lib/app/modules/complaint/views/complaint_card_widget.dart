import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import '/app/theme/app_colors.dart';
import '/app/theme/ui_helpers.dart';
import '/models/complaint_model.dart';
import '/services/database.dart';

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
              Text('ID - ${complaint.id ?? ''}'),
              const Spacer(),
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
                      title: "Ocean Beach",
                    );
                  }),
              if (complaint.latitude != 0 && complaint.longitude != 0)
                horizontalSpaceTiny,
              if (complaint.latitude != 0 && complaint.longitude != 0)
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
              ],
            ),
          ),
        ),
        verticalSpaceSmall,
      ],
    );
  }
}
