import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_id_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class MembershipController extends GetxController {
  final count = 0.obs;
  final privilage = false.obs;
  final membershipDataId = <MembershipDataId>[].obs;
  final userData = Get.put(UserController());
  final isLoading = false.obs;

  // final membershipPrivilage = [
  //   "Professional Development Training Programs",
  //   "Succes Kit",
  //   "Birthday Gift Set",
  //   "Gift Cosmetic Products + BPOM Certificate",
  //   "Eid Gift",
  //   "Exclusive Merchandise",
  // ].obs;
  @override
  void onInit() {
    super.onInit();
    fetchMembershipDataId();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchMembershipDataId() async {
    // print(userData.user.membershipId);
    isLoading(true);
    final formData = FormData.fromMap(
        {'membership_id': userData.user.membershipId.toString()});
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.membershipDataId, formData);

      final data = response!.data['data'] as List;

      membershipDataId.value = data
          .map(
            (items) => MembershipDataId.fromJson(items),
          )
          .toList();

      if (response.statusCode == 200) {
      } else if (response.statusCode == 500) {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data membership",
        );
      } else {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data membership",
        );
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  claimPrivilage() {
    privilage(true);
    privilage.value
        ? SnackbarFLdev.snackShow(
            title: "Hak istimewa diambil", message: "Silahkan pakai")
        : null;
    update();
  }
}
