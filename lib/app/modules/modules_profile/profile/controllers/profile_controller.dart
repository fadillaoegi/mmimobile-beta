import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:mmimobile/app/api/api.dart';
// import 'package:mmimobile/app/data/models/user_model.dart';
// import 'package:mmimobile/app/data/sources/source_apps.dart';
// import 'package:mmimobile/app/session/user_session.dart';
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
    // isLoading(true);
    // final formData = FormData.fromMap({
    //   'customer_id': userData.user.customerId,
    // });
    // try {
    //   // Ambil data terbaru dari session (bisa dari API)
    //   final result = await SourceApps.hitApiToMap(ApiApps.getUser, formData);
    //   User user = User.fromJson(result!['data']);
    //   SessionUserFLdev.saveUser(user);
    //   // User? updatedUser = await SessionUserFLdev.getUser();

    //   // if (updatedUser != null) {
    //   //   final userController = Get.put(UserController());
    //   //   userController.setData(updatedUser);
    //   // }
    // } catch (e) {
    //   print("Error refreshing user data: $e");
    // } finally {
    //   isLoading(false);
    // }
  }
}
