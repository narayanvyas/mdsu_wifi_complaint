import 'package:get/get.dart';
import '/models/user_model.dart';

class GlobalController extends GetxController {
  final Rx<UserModel> user = UserModel.fromJson({}).obs;
}
