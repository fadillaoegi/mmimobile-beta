import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/history_detail_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HistoryDetailController extends GetxController {
  final RxList<HistoryDetail> items = <HistoryDetail>[].obs; // Data dari API
  final RxBool isLoading = false.obs; // Status loading
  final RxString errorMessage = ''.obs; // Pesan error, jika ada
  late String customerId; // Diambil dari UserController
  late String soId; // Diterima sebagai argumen

  // Tambahkan RxInt untuk mengontrol jumlah item yang ditampilkan
  final RxInt visibleItemCount = 3.obs;
  final RxBool isExpanded =
      false.obs; // Untuk melacak apakah list terbuka penuh atau tidak

  final UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    customerId = userController.user.customerId ?? '';
    soId = Get.arguments['idSo'] ?? '';
    fetchHistoryDetail();
  }

  Future<void> fetchHistoryDetail() async {
    if (soId.isEmpty) {
      errorMessage.value = 'SO ID is missing';
      return;
    }
    isLoading.value = true;

    final formData = FormData.fromMap({'so_id': soId});

    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.historyDetail, formData);

      if (response != null && response.statusCode == 200) {
        final jsonData = response.data['data'];

        if (jsonData is List) {
          items.assignAll(
              jsonData.map((item) => HistoryDetail.fromJson(item)).toList());
        } else {
          errorMessage.value = 'Invalid data format received';
        }
      } else {
        errorMessage.value = 'Failed to fetch data. Please try again later.';
      }
    } catch (e) {
      errorMessage.value = 'Error: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
