import 'package:get/get.dart';

import '../controllers/add_email_controller.dart';

class AddEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEmailController>(
      () => AddEmailController(),
    );
  }
}
