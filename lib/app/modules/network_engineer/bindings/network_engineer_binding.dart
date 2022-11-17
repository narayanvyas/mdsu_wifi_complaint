import 'package:get/get.dart';

import '../controllers/network_engineer_controller.dart';

class NetworkEngineerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkEngineerController>(
      () => NetworkEngineerController(),
    );
  }
}
