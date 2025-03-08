import 'package:get/get.dart';

import '../controllers/support_detail_controller.dart';

class SupportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportDetailController>(
      () => SupportDetailController(),
    );
  }
}
