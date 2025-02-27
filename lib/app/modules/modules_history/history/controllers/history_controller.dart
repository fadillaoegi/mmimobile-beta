import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/history_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HistoryController extends GetxController {
  final isLoading = false.obs;
  final historyList = <HistorySo>[].obs;
  final offset = 0.obs; // Awal offset diatur ke 0
  final limit = 5.obs; // Limit jumlah data per fetch
  final hasMoreData =
      true.obs; // Untuk memeriksa apakah masih ada data tambahan

  @override
  void onInit() {
    super.onInit();
    final user = Get.put(UserController());
    final customerId = user.user.customerId;
    print(customerId);
    fetchHistory(customerId!, null);
  }

  Future<void> fetchHistory(String customerId, String? search,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !hasMoreData.value)
      return; // Hentikan jika tidak ada data tambahan

    if (!isLoadMore) {
      // Reset data saat refresh
      offset.value = 0;
      historyList.clear();
      hasMoreData.value = true;
    }

    isLoading(true);
    try {
      final formData = FormData.fromMap({
        'customer_id': customerId,
        'limit': limit.value,
        'offset': offset.value, // send offset for pagination
        'search': search,
      });

      final response =
          await RequestApp.postFutureDio(ApiApps.history, formData);

      if (response?.statusCode == 200) {
        final jsonResponse = response!.data;

        if (jsonResponse["status"] == true) {
          final data = List<HistorySo>.from(
            jsonResponse["data"].map((item) => HistorySo.fromJson(item)),
          );

          if (data.isNotEmpty) {
            if (isLoadMore) {
              historyList.addAll(data);
            } else {
              historyList.assignAll(data);
            }

            // Perbarui offset untuk load berikutnya
            offset.value += data.length;

            // Periksa apakah masih ada data tambahan
            if (data.length < limit.value) {
              hasMoreData(
                  false); // Tidak ada data tambahan jika data yang dimuat kurang dari limit
            }
          } else {
            // Tidak ada data baru
            hasMoreData(false);
          }
        } else {
          print("Error: ${jsonResponse["message"] ?? 'Unknown error'}");
          hasMoreData(false);
        }
      } else {
        print("Failed to fetch history. Status code: ${response?.statusCode}");
        hasMoreData(false);
      }
    } catch (e) {
      print("Error: $e");
      hasMoreData(false);
    } finally {
      isLoading(false);
    }
  }
}
