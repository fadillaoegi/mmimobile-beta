import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/survey/survey_content_model.dart';

class RatingServicesController extends GetxController {
  final isLoading = false.obs;
  final questionsSurveyRatings = <SurveyContent>[].obs;
  final surveyData = [].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    fetchSurveyContent(args['surveyMenuId'].toString());
  }

  // NOTE: List for save rating every question
  var ratings = <double>[].obs;

  void updateRating(int index, double value) {
    ratings[index] = value;
  }

  void submitReview() {
    final surveyDetailAssessment = "".obs;
    final surveyDetailPoint = "".obs;
    for (int i = 0; i < questionsSurveyRatings.length; i++) {
      // surveyDetailAssessment.value +=
      //     "${questionsSurveyRatings[i].masterSurveyDetailAssessment}\nRating: ${ratings[i]}\n\n";
      surveyDetailAssessment.value +=
          "${questionsSurveyRatings[i].masterSurveyDetailAssessment}\n\n";
      surveyDetailPoint.value += "${ratings[i]}\n\n";
    }

    Get.snackbar(
      "Review Dikirim",
      titleText: Text(surveyDetailAssessment.value.toString()),
      surveyDetailPoint.value.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  fetchSurveyContent(String surveyId) async {
    final formData = FormData.fromMap({
      "survey_id": surveyId,
    });
    try {
      isLoading(true);
      final response =
          await RequestApp.postFutureDio(ApiApps.getSurveyContent, formData);

      final data = response!.data['data'] as List;
      questionsSurveyRatings.value = data
          .map(
            (e) => SurveyContent.fromJson(e),
          )
          .toList();
      // NOTE: Initial rating value default
      ratings.assignAll(
          List.generate(questionsSurveyRatings.length, (index) => 3.5));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
