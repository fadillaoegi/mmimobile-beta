import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/survey/survey_menu_model.dart';

class SurveyController extends GetxController {
  final isLoading = false.obs;
  final listSurveyMenu = <SurveyMenu>[].obs;
  @override
  void onInit() {
    super.onInit();
    refresh();
  }

  Future<void> refresh() async {
    isLoading(true);
    try {
      fetchMenuSurvey();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  fetchMenuSurvey() async {
    final formData = FormData.fromMap({});
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getSurveyMenu, formData);

      final data = response!.data['data'] as List;
      listSurveyMenu.value = data
          .map(
            (e) => SurveyMenu.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
