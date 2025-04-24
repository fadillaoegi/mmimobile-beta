import 'package:get/get.dart';

import '../controllers/detail_high_light_controller.dart';

class DetailHighLightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHighLightController>(
      () => DetailHighLightController(),
    );
  }
}
