import 'package:get/get.dart';
import '../controllers/system_support_controller.dart';

class SystemSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemSupportController>(
      () => SystemSupportController(),
    );
  }
}
