import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alerts/rflutter_alerts.dart';
import '/app/global.dart';
import '/models/user_model.dart';

import '../../../../services/database.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/form_field_styles.dart';
import '../../../theme/text_styles.dart';
import '../../../theme/ui_helpers.dart';
import '../../../utils/app_texts.dart';

class NetworkEngineerController extends GetxController {
  RxList<UserModel> engineers = <UserModel>[].obs;
  final TextEditingController engineerNameController = TextEditingController();
  final TextEditingController engineerEmailController = TextEditingController();
  final TextEditingController engineerPasswordController =
      TextEditingController();

  bool validateForm() {
    if (engineerNameController.text.length < 2) {
      showSnackbar('Please Enter Valid Name', Status.failed);
      return false;
    } else if (!GetUtils.isEmail(engineerEmailController.text)) {
      showSnackbar('Please Enter Valid Email', Status.failed);
      return false;
    } else if (engineerPasswordController.text.length < 8) {
      showSnackbar('Password must be of minimum 8 characters', Status.failed);
      return false;
    } else {
      return true;
    }
  }

  showNetworkEngineerDialog(BuildContext context, bool isEdit,
      [UserModel? user]) async {
    if (isEdit && user != null) {
      engineerNameController.text = isEdit ? user.name ?? '' : '';
      engineerEmailController.text = isEdit ? user.email ?? '' : '';
      engineerPasswordController.text = '';
    } else {
      engineerNameController.text = '';
      engineerEmailController.text = '';
      engineerPasswordController.text = '';
    }
    Alert(
      context: context,
      title: '${isEdit ? 'Update' : 'Add'} Network Engineer',
      desc: isEdit
          ? 'Update details of network engineer'
          : 'Kindly fill the details to add a new engineer',
      style: AlertStyle(
          titleStyle: headlineTwoDarkStyle,
          descStyle: darkBodyStyle.copyWith(height: 1.5)),
      content: Column(
        children: [
          verticalSpaceMedium,
          Theme(
            data: Get.theme.copyWith(
              textTheme: TextTheme(
                subtitle1: TextStyle(color: AppColors.primaryColor),
              ),
              inputDecorationTheme: outlineInputTextFormFieldStyleTwo.copyWith(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.primaryColor!),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            child: TextFormField(
              controller: engineerNameController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Engineer\'s Name',
              ),
            ).paddingSymmetric(horizontal: 10),
          ),
          verticalSpaceMedium,
          Theme(
            data: Get.theme.copyWith(
              textTheme: TextTheme(
                subtitle1: TextStyle(color: AppColors.primaryColor),
              ),
              inputDecorationTheme: outlineInputTextFormFieldStyleTwo.copyWith(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.primaryColor!),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ),
            child: TextFormField(
              controller: engineerEmailController,
              enabled: !isEdit,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Engineer\'s Email',
              ),
            ).paddingSymmetric(horizontal: 10),
          ),
          if (!isEdit) verticalSpaceMedium,
          if (!isEdit)
            Theme(
              data: Get.theme.copyWith(
                textTheme: TextTheme(
                  subtitle1: TextStyle(color: AppColors.primaryColor),
                ),
                inputDecorationTheme:
                    outlineInputTextFormFieldStyleTwo.copyWith(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppColors.primaryColor!),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              child: TextFormField(
                controller: engineerPasswordController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Engineer\'s Account Password',
                ),
              ).paddingSymmetric(horizontal: 10),
            ),
          verticalSpaceMedium,
        ],
      ),
      buttons: [
        DialogButton(
          color: Colors.transparent,
          border: Border.all(width: 1, color: AppColors.primaryColor!),
          radius: BorderRadius.circular(2),
          onPressed: () => Get.back(),
          width: 120,
          child: DialogButtonText(
            "Cancel",
          ),
        ),
        DialogButton(
          color: AppColors.primaryColor,
          border: Border.all(width: 1, color: Colors.transparent),
          radius: BorderRadius.circular(2),
          onPressed: () async {
            if (isEdit) {
              if (engineerNameController.text.length < 2) {
                showSnackbar('Please enter valid name', Status.failed);
              } else {
                if (user != null) {
                  user.name = engineerNameController.text;
                  await Database().updateUser(user);
                }
              }
            } else if (validateForm()) {
              await Database().createNewUser(
                  engineerEmailController.text,
                  engineerPasswordController.text,
                  engineerNameController.text,
                  'network_engineer');
              Get.back();
              await showSnackbar(
                  'Network Engineer Added Successfully', Status.success);
            }
          },
          width: 120,
          child: Text(
            isEdit ? 'Update' : 'Add',
            style: lightButtonTextStyle.copyWith(color: AppColors.whiteColor),
          ),
        )
      ],
    ).show();
  }

  @override
  void onInit() {
    engineers.bindStream(Database().networkEngineersStream());
    super.onInit();
  }
}
