import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
