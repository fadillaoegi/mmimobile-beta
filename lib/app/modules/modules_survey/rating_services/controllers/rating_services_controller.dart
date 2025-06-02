import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
import 'package:mmimobile/app/data/models/survey/survey_content_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class RatingServicesController extends GetxController {
  final isLoading = false.obs;
  final questionsSurveyRatings = <SurveyContent>[].obs;
  final surveyData = <Map<String, dynamic>>[].obs;
  final surveyId = ''.obs;
  final surveyMenuPoint = ''.obs;
  final userData = Get.put(UserController());

  final ratings = <double>[].obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    surveyId.value = args['surveyMenuId'].toString();
    surveyMenuPoint.value = args['surveyMenuPoint'].toString();
    fetchSurveyContent();
  }

  void updateRating(int index, double value) {
    if (index < ratings.length) {
      ratings[index] = value;
    }
  }

  Future<void> fetchSurveyContent() async {
    isLoading.value = true;
    final formData = FormData.fromMap({
      "survey_id": surveyId.value,
    });

    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getSurveyContent, formData);

      if (response != null && response.data['data'] != null) {
        final data = response.data['data'] as List;
        questionsSurveyRatings.value =
            data.map((e) => SurveyContent.fromJson(e)).toList();

        // Default nilai rating
        ratings.assignAll(
            List.generate(questionsSurveyRatings.length, (index) => 3.5));
      } else {
        questionsSurveyRatings.clear();
        ratings.clear();
        print("Data kosong atau null.");
      }
    } catch (e) {
      print("Error saat fetch content survey: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> sendSurvey() async {
    try {
      final formData = FormData.fromMap({
        "customer_id": userData.user.customerId.toString(),
        "master_survey_point": surveyMenuPoint.value,
        "master_survey_id": surveyId.value,
        "survey_data": surveyData.toList(),
      });

      final response =
          await RequestApp.postFutureDio(ApiApps.saveSurvey, formData);
      print(response?.data);

      return response != null && response.data['status'] == true;
    } catch (e) {
      print("Error saat mengirim survey: $e");
      return false;
    }
  }

  void submitReview() {
    Get.dialog(
      AlertDialogApps(
        lotties: AssetConfigFLdev.lottieWarning,
        postive: true,
        title: "Anda yakin?",
        content: "Sudah yakin dengan penilaian Anda?",
        onTap: () async {
          Get.back(); // Tutup dialog konfirmasi

          if (ratings.length != questionsSurveyRatings.length) {
            Get.snackbar(
              "Review Gagal",
              "Semua pertanyaan harus diberi rating.",
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }

          final data = List.generate(questionsSurveyRatings.length, (i) {
            return {
              'survey_result_detail_point': ratings[i],
              'survey_result_detail_desc': "",
              'survey_result_id': surveyId.value,
              "master_survey_detail_id":
                  questionsSurveyRatings[i].masterSurveyDetailId,
              "master_survey_detail_assessment":
                  questionsSurveyRatings[i].masterSurveyDetailAssessment,
            };
          });

          surveyData.assignAll(data);

          if (surveyData.isEmpty) {
            Get.snackbar(
              "Review Gagal",
              "Data review tidak boleh kosong",
              snackPosition: SnackPosition.BOTTOM,
            );
            return;
          }

          isLoading.value = true;
          final success = await sendSurvey();
          isLoading.value = false;

          if (success) {
            Get.dialog(AlertDialogNoAction(
              lotties: AssetConfigFLdev.lottieSuccess,
              title: "Berhasil",
              content: "Penilaian berhasil dikirim!",
            ));

            await Future.delayed(Duration(seconds: 2));
            Get.back(); // Tutup dialog sukses

            await Future.delayed(Duration(seconds: 1)); // jeda sebentar

            Get.dialog(
              AlertDialogNoAction(
                lotties: AssetConfigFLdev.lottieCupFLdev,
                title: 'Anda mendapat ${surveyMenuPoint.value} poin',
                content: '${surveyMenuPoint.value} poin berhasil ditambahkan.',
              ),
              barrierDismissible: false,
            );

            await Future.delayed(Duration(seconds: 2));
            Get.back(); // Tutup dialog poin
            Get.back();
          } else {
            Get.snackbar(
              "Review Gagal",
              "Gagal mengirim survey. Coba lagi nanti.",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
      ),
    );
  }
}
