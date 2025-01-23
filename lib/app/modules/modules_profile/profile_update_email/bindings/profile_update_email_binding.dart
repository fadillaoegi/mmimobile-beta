import 'package:get/get.dart';

import '../controllers/profile_update_email_controller.dart';

class ProfileUpdateEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateEmailController>(
      () => ProfileUpdateEmailController(),
    );
  }
}
