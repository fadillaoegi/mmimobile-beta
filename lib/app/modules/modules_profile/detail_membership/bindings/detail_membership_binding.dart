import 'package:get/get.dart';

import '../controllers/detail_membership_controller.dart';

class DetailMembershipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMembershipController>(
      () => DetailMembershipController(),
    );
  }
}
