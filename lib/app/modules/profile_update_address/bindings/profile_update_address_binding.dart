import 'package:get/get.dart';

import '../controllers/profile_update_address_controller.dart';

class ProfileUpdateAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUpdateAddressController>(
      () => ProfileUpdateAddressController(),
    );
  }
}
