import 'package:get/get.dart';

import '../controllers/support_system_class_controller.dart';

class SupportSystemClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportSystemClassController>(
      () => SupportSystemClassController(),
    );
  }
}
