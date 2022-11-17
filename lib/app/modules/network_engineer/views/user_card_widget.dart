import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wifi_complaint/app/global.dart';
import '/app/controllers/dialog_controller.dart';
import '/app/modules/network_engineer/controllers/network_engineer_controller.dart';
import '/models/user_model.dart';
import '/services/database.dart';
import '../../../theme/ui_helpers.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class UserCardWidget extends GetView<NetworkEngineerController> {
  final UserModel user;
  const UserCardWidget({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth(context) - 250.w,
                      child: Text(
                        user.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.orange,
                        ),
                        onPressed: () async {
                          await controller.showNetworkEngineerDialog(
                              context, true, user);
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.security_outlined,
                          color: Colors.green,
                        ),
                        onPressed: () async {
                          await Get.find<DialogController>().showDialog(
                              context: context,
                              title: 'Change Password',
                              message:
                                  'We will send an password reset email on the registered email to reset the password.',
                              action: () async {
                                await Database()
                                    .sendPasswordResetEmail(user.email ?? '');
                              },
                              submitButtonText: 'Change Password',
                              isShowCancelButton: true);
                        }),
                    IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () async {
                          await Get.find<DialogController>().showDialog(
                              context: context,
                              title: 'Delete User',
                              message:
                                  'Are you sure you want to delete the user?',
                              action: () async {
                                await Database().deleteUser(user.id ?? '');
                                await showSnackbar(
                                    'Network Engineer Deleted Successfully',
                                    Status.success);
                                Get.back();
                              },
                              submitButtonText: 'Yes',
                              isShowCancelButton: true);
                        }),
                  ],
                ),
                const Divider(),
                verticalSpaceSmall,
                Text('Email - ${user.email ?? ''}'),
                verticalSpaceMedium,
                Text(
                    'Created on ${DateFormat('dd-MM-yyyy, hh:mm a').format((user.createdAt as Timestamp).toDate())}'),
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
