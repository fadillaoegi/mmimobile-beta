import 'package:get/get.dart';

class RatingProductController extends GetxController {
  final questionsSurveyRatings = [
    "Apakah anda puas dengan layanan dan keramahan marketing kami?",
    "Apakah marketing kami memberikan informasi yang Anda butuhkan secara jelas dan lengkap?",
    "Seberapa cepat marketing kami merespons pertanyaan atau masalah Anda?",
  ].obs;

  // List untuk menyimpan rating tiap pertanyaan
  var ratings = <double>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi rating default (3 untuk setiap pertanyaan)
    ratings.assignAll(List.filled(questionsSurveyRatings.length, 3.0));
  }

  void updateRating(int index, double value) {
    if (index >= 0 && index < ratings.length) {
      ratings[index] = value;
    }
  }

  void submitReview() {
    String result = "";
    for (int i = 0; i < questionsSurveyRatings.length; i++) {
      result +=
          "Q${i + 1}: ${questionsSurveyRatings[i]}\nRating: ${ratings[i]}\n\n";
    }

    Get.snackbar(
      "Review Dikirim",
      result,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
