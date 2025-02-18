import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/history_model.dart';

class HistoryController extends GetxController {
  final isLoading = false.obs;
  final historyList = <HistorySo>[].obs;
  final offset = 0.obs;
  final limit = 5.obs; // Default 10 items per request
  final hasMoreData = true.obs;

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

  Future<void> fetchHistory(String customerId,
      {bool isLoadMore = false}) async {
    if (isLoadMore && !hasMoreData.value) return;

    if (!isLoadMore) {
      // Reset offset and data for refresh
      offset.value = 0;
      historyList.clear();
      hasMoreData.value = true;
    }
    isLoading(true);
    try {
      final formData = FormData.fromMap({
        'customer_id': "4284",
        'limit': limit.value,
      });

      final response =
          await RequestApp.postFutureDio(ApiApps.history, formData);

      if (response!.statusCode == 200) {
        final jsonResponse = response.data;

        if (jsonResponse["status"] == true) {
          final data = List<HistorySo>.from(
            jsonResponse["data"].map((item) => HistorySo.fromJson(item)),
          );

          if (isLoadMore) {
            historyList.addAll(data);
          } else {
            historyList.assignAll(data);
          }
          // Update offset for the next load
          offset.value = jsonResponse["nextOffset"] ?? 0;
        } else {
          print("Error: ${jsonResponse["message"] ?? 'Unknown error'}");
          hasMoreData(false);
        }
      } else {
        print("Failed to fetch history. Status code: ${response.statusCode}");
        hasMoreData(false);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
