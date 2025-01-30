import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

import '../controllers/profile_update_phone_controller.dart';

class ProfileUpdatePhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdatePhoneController>(
      () => ProfileUpdatePhoneController(),
    );
    Get.put(UserController());
  }
}
