import 'package:get/get.dart';

import '../controllers/profile_edit_name_controller.dart';

class ProfileEditNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditNameController>(
      () => ProfileEditNameController(),
    );
  }
}
