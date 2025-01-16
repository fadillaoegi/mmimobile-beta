import 'package:get/get.dart';

import '../controllers/profile_edit_password_controller.dart';

class ProfileEditPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditPasswordController>(
      () => ProfileEditPasswordController(),
    );
  }
}
