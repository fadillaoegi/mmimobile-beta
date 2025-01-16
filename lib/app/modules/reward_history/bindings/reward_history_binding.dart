import 'package:get/get.dart';

import '../controllers/reward_history_controller.dart';

class RewardHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardHistoryController>(
      () => RewardHistoryController(),
    );
  }
}
