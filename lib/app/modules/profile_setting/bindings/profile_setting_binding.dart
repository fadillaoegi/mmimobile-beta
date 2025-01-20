import 'package:get/get.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';

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
