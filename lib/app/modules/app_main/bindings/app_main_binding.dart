import 'package:get/get.dart';

import '../controllers/app_main_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AppMainController>(
    //   () => AppMainController(),
    // );
    Get.put(AppMainController());
  }
}
