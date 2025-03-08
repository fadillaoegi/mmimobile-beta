import 'package:get/get.dart';

import '../controllers/rating_product_controller.dart';

class RatingProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingProductController>(
      () => RatingProductController(),
    );
  }
}
