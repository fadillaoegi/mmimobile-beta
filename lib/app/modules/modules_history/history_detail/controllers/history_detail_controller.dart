import 'package:get/get.dart';

class HistoryDetailController extends GetxController {
  final RxList<Map<String, dynamic>> items =
      <Map<String, dynamic>>[].obs; // Semua data
  final RxInt displayedItemCount = 2.obs; // Jumlah data yang terlihat
  final int incrementCount = 2; // Jumlah tambahan data setiap "See More"

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // Memuat data awal
  }

  void fetchItems() {
    // Simulasi data
    items.addAll(List.generate(
      10,
      (index) => {
        "productName": "Product $index",
        "brandName": "Brand $index",
        "date": "01-October-2024",
        "priceProduct": 10 + index,
        "qty": 5 + index,
        "count": (10 + index) * (5 + index),
      },
    ));
  }

  void toggleSeeMore() {
    // Menambah jumlah data yang terlihat jika belum semua ditampilkan
    if (displayedItemCount.value < items.length) {
      displayedItemCount.value =
          (displayedItemCount.value + incrementCount).clamp(0, items.length);
    } else {
      displayedItemCount.value =
          2; // Reset ke data awal jika semua sudah terlihat
    }
  }
}
