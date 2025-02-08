import 'package:get/get.dart';

class RatingServicesController extends GetxController {
  final count = 0.obs;

  var ratings =
      <int>[10, 5, 15, 20, 50].obs; // Jumlah pengguna untuk rating 1-5
  int get totalUsers => ratings.fold(0, (sum, value) => sum + value);

  double get averageRating {
    int totalRatings = ratings
        .asMap()
        .entries
        .fold(0, (sum, entry) => sum + (entry.key + 1) * entry.value);
    int totalUsers = ratings.fold(0, (sum, value) => sum + value);
    return totalUsers == 0 ? 0.0 : totalRatings / totalUsers;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
