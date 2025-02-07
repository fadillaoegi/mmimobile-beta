import 'package:get/get.dart';

import '../controllers/rating_services_controller.dart';

class RatingServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingServicesController>(
      () => RatingServicesController(),
    );
  }
}
