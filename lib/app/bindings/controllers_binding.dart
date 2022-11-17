// Package imports:
import 'package:get/get.dart';
import '/app/modules/network_engineer/controllers/network_engineer_controller.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';

// Project imports:
import '/app/controllers/dialog_controller.dart';
import '/app/controllers/global_controller.dart';
import '/app/modules/auth/controllers/auth_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';

class ControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put(DialogController());
    Get.put(NetworkEngineerController());
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(ComplaintController());
  }
}
