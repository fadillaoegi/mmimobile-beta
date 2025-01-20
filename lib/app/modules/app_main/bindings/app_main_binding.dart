import 'package:get/get.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';

import '../controllers/app_main_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.put(AppMainController());
  }
}
