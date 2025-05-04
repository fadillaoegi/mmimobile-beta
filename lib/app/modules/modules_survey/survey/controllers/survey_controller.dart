import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SurveyController extends GetxController {
  final isLoading = false.obs;
  final listSurvey = [
    {
      "master_survey_id": "1",
      "master_survey_title": "Rating Layanan",
    },
    {
      "master_survey_id": "1",
      "master_survey_title": "Rating Kualitas Product",
    },
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  refresh() async {
    try {} catch (e) {
      print(e);
    } finally {}
  }
}
