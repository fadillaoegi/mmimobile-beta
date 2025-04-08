import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/helpers/refresh_data_fldev.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final userData = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> refreshUserData() async {
    isLoading(true);
    final formData = FormData.fromMap({
      'customer_id': userData.user.customerId,
    });

    RefreshDataFldev.refreshDataUser(formData);

    isLoading(false);
  }
}
