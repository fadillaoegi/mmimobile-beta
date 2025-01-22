import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.lazyPut<ProfileSettingController>(
      () => ProfileSettingController(),
    );
  }
}
