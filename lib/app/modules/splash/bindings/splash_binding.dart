import 'package:get/get.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(),
    );
  }
}
