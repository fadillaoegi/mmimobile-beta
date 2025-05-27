import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/survey/survey_content_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class RatingServicesController extends GetxController {
  final isLoading = false.obs;
  final questionsSurveyRatings = <SurveyContent>[].obs;
  final surveyData = [].obs;
  final surveyId = ''.obs;
  final surveyMenuPoint = ''.obs;
  final userData = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    surveyId.value = args['surveyMenuId'].toString();
    surveyMenuPoint.value = args['surveyMenuPoint'].toString();
    refresh();
  }

  // NOTE: List for save rating every question
  var ratings = <double>[].obs;

  void updateRating(int index, double value) {
    ratings[index] = value;
  }

  refresh() async {
    isLoading(true);
    try {
      fetchSurveyContent();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<bool> sendSurvey() async {
    final formData = FormData.fromMap({
      "customer_id": userData.user.customerId.toString(),
      "master_survey_point": surveyMenuPoint.value.toString(),
      "master_survey_id": surveyId.value.toString(),
      "survey_data": surveyData.toList(),
    });

    final response =
        await RequestApp.postFutureDio(ApiApps.saveSurvey, formData);
    print(response!.data);

    bool ada = response.data;

    return ada;
  }

  void submitReview() async {
    final surveyDetailAssessment = "".obs;
    final surveyDetailPoint = "".obs;
    final List<Map<String, dynamic>> data = [];
    for (int i = 0; i < questionsSurveyRatings.length; i++) {
      surveyDetailAssessment.value +=
          "${questionsSurveyRatings[i].masterSurveyDetailAssessment}\n\n";
      surveyDetailPoint.value += "${ratings[i]}\n\n";

      // NOTE:
      data.add({
        'survey_result_detail_point': ratings[i],
        'survey_result_detail_desc': "",
        'survey_result_id': surveyId.value,
        "master_survey_detail_id":
            questionsSurveyRatings[i].masterSurveyDetailId,
        "master_survey_detail_assessment":
            questionsSurveyRatings[i].masterSurveyDetailAssessment,
      });
    }

    surveyData.value = data;
    final xixi = surveyData;
    print(xixi.toList());

    if (xixi.isEmpty) {
      Get.snackbar(
        "Review Gagal",
        // titleText: Text(surveyDetailAssessment.value.toString()),
        "Gagal",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    bool hehe = await sendSurvey();
    if (hehe) {
      SnackbarFLdev.snackShow(title: "ijijijijiji", message: "");
    }
    // Get.snackbar(
    //   "Review Dikirim",
    //   titleText: Text(surveyDetailAssessment.value.toString()),
    //   surveyDetailPoint.value.toString(),
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

  fetchSurveyContent() async {
    // isLoading(true);
    final formData = FormData.fromMap({
      // "survey_id": surveyId,
      "survey_id": surveyId.value.toString(),
    });
    try {
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
      // isLoading(false);
    }
  }
}
