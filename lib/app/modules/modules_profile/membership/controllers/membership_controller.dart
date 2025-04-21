import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
import 'package:mmimobile/app/helpers/refresh_data_fldev.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_benefit_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class MembershipController extends GetxController {
  final count = 0.obs;
  final privilage = false.obs;
  final membershipDataBenefit = <MembershipDataBenefit>[].obs;
  final membershipData = MembershipData().obs;
  final userData = Get.put(UserController());
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchMembershipDataBenefitId();
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

  // NOTE: Refresh Data
  refreshData() async {
    isLoading(true);
    try {
      fetchMembershipDataId();
      RefreshDataFldev.refreshDataUser(
          FormData.fromMap({'customer_id': userData.user.customerId}));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // NOTE: fetch data membership
  fetchMembershipDataId() async {
    isLoading(true);
    final formData = FormData.fromMap(
        {'membership_id': userData.user.membershipId.toString()});
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.membershipDataId, formData);

      final rawData = response!.data['data'];
      membershipData.value = MembershipData.fromJson(rawData);
      print("ORINT: ${membershipData.value}");

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

  // NOTE: fetch data membership Benefit
  fetchMembershipDataBenefitId() async {
    isLoading(true);
    final formData = FormData.fromMap(
        {'membership_id': userData.user.membershipId.toString()});
    try {
      final response = await RequestApp.postFutureDio(
          ApiApps.membershipDataBenefitId, formData);

      final data = response!.data['data'] as List;

      membershipDataBenefit.value = data
          .map(
            (items) => MembershipDataBenefit.fromJson(items),
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
