import 'package:get/get.dart';

class RatingServicesController extends GetxController {
  final count = 0.obs;

  // Data rating, setiap indeks mewakili jumlah pengguna yang memberikan rating 1-5
  // final ratingsCount = [10, 20, 15, 30, 25].obs;

  // // Menghitung total jumlah pengguna yang memberikan rating
  // int get totalUsers => ratingsCount.reduce((a, b) => a + b);

  // // Menghitung rata-rata rating
  // double get averageRating {
  //   int totalRating = 0;
  //   for (int i = 0; i < ratingsCount.length; i++) {
  //     totalRating += (i + 1) * ratingsCount[i];
  //   }
  //   return totalUsers > 0 ? totalRating / totalUsers : 0.0;
  // }

  // // Fungsi untuk menambah rating
  // void addRating(int rating) {
  //   if (rating >= 1 && rating <= 5) {
  //     ratingsCount[rating - 1] += 1;
  //     ratingsCount.refresh();
  //   }
  // }

  // var rating = 3.0.obs;

  var ratings =
      <int>[10, 5, 15, 20, 50].obs; // Jumlah pengguna untuk rating 1-5

  double get averageRating {
    int totalRatings = ratings
        .asMap()
        .entries
        .fold(0, (sum, entry) => sum + (entry.key + 1) * entry.value);
    int totalUsers = ratings.fold(0, (sum, value) => sum + value);
    return totalUsers == 0 ? 0.0 : totalRatings / totalUsers;
  }

  int get totalUsers => ratings.fold(0, (sum, value) => sum + value);
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
