import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/survey/survey_content_model.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';

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

      // NOTE: for validasi
      if (response != null && response.data['status'] == true) {
        return true;
      }
    } catch (e) {
      print("Error saat mengirim survey: $e");
    }

    return false;
  }

  void submitReview() {
    Get.dialog(AlertDialogApps(
      lotties: AssetConfigFLdev.lottieWarning,
      postive: true,
      title: "Anda yakin ?",
      content: "Sudah yakin dengan penilaian anda ?",
      onTap: () async {
        if (ratings.length != questionsSurveyRatings.length) {
          Get.snackbar(
            "Review Gagal",
            "Semua pertanyaan harus diberi rating.",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        final List<Map<String, dynamic>> data = [];

        for (int i = 0; i < questionsSurveyRatings.length; i++) {
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

        surveyData.assignAll(data); // assign ke RxList

        if (surveyData.isEmpty) {
          Get.snackbar(
            "Review Gagal",
            "Data review tidak boleh kosong",
            snackPosition: SnackPosition.BOTTOM,
          );
          return;
        }

        // Tampilkan loading sementara submit
        isLoading.value = true;
        final success = await sendSurvey();
        isLoading.value = false;

        if (success) {
          Get.dialog(AlertDialogNoAction(
            lotties: AssetConfigFLdev.lottieSuccess,
            title: "Berhasil",
            content: "Penilaian berhasil !",
          ));
          Future.delayed(
            Duration(seconds: 4),
            () => Get.back(),
          );
          Future.delayed(
            Duration(seconds: 6),
            () {
              Get.dialog(
                AlertDialogNoAction(
                  lotties: AssetConfigFLdev.lottieCupFLdev,
                  title: 'Anda mendapat ${surveyMenuPoint.value} point',
                  content:
                      '${surveyMenuPoint.value} point berhasil ditambahkan',
                ),
                barrierDismissible: false,
              );

              Future.delayed(
                const Duration(seconds: 3),
                () => Get.back(), // Tutup dialog
              );
            },
          );
        } else {
          Get.snackbar(
            "Review Gagal",
            "Gagal mengirim survey, silakan coba lagi.",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
        Get.back();
      },
    ));
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
