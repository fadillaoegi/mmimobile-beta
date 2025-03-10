import 'package:get/get.dart';

import '../controllers/list_support_controller.dart';

class ListSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSupportController>(
      () => ListSupportController(),
    );
  }
}
