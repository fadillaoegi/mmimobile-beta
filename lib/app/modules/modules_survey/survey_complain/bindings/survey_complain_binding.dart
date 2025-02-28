import 'package:get/get.dart';

import '../controllers/survey_complain_controller.dart';

class SurveyComplainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SurveyComplainController>(
      () => SurveyComplainController(),
    );
  }
}
