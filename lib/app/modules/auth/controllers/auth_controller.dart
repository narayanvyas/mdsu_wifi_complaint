import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user_model.dart';
import '../../../../services/database.dart';
import '../../../controllers/global_controller.dart';
import '../../../global.dart';

class AuthController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> getCurrentUser() async {
    try {
      if (auth.currentUser != null) {
        UserModel? user = await Database().getUser(auth.currentUser!.uid);
        Get.find<GlobalController>().user.value = user ?? UserModel();
        Get.find<GlobalController>().update();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> performUserLogin() async {
    if (validateLoginInput()) {
      await Database().loginUser(
        loginEmailController.text.trim().toLowerCase(),
        loginPasswordController.text,
      );
    }
  }

  /// Validate the login form input
  bool validateLoginInput() {
    if (!GetUtils.isEmail(loginEmailController.text.trim())) {
      showSnackbar('Please Enter Valid Email ID', Status.failed);
      return false;
    } else if (loginPasswordController.text.length < 8) {
      showSnackbar('Password Must Be Minimum of 8 Characters', Status.failed);
      return false;
    }
    return true;
  }

  /// perform signout from Firebase and clear local variables.
  Future<void> signOut() async {
    await auth.signOut().then((value) {
      Get.find<GlobalController>().user.value = UserModel();
      Get.find<GlobalController>().update();
    });
  }

  @override
  void onInit() async {
    await getCurrentUser();
    super.onInit();
  }
}
