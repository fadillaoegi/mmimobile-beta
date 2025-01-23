import 'package:get/get.dart';

import '../controllers/profile_update_phone_controller.dart';

class ProfileUpdatePhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdatePhoneController>(
      () => ProfileUpdatePhoneController(),
    );
  }
}
