import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_benefit_model.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class DetailMembershipController extends GetxController {
  final userData = Get.put(UserController());
  final isLoading = false.obs;
  final dataMembership = <MembershipData>[].obs;
  final membershipDataBenefit = <MembershipDataBenefit>[].obs;
  final selectedCategoryId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategoryId.value = userData.user.membershipId.toString();
    refreshDataMembership();
    fetchDataMembershipBenefit();
    update();
  }

  void setCategory(String categoryId) {
    selectedCategoryId.value = categoryId;
    fetchDataMembershipBenefit();
    update();
  }

  fetchDataMembershipBenefit() async {
    isLoading(true);
    final formData = FormData.fromMap({
      "membership_id": selectedCategoryId.value.toString(),
      // "membership_id": userData.user.membershipId.toString(),
    });
    try {
      final response = await RequestApp.postFutureDio(
          ApiApps.membershipDataBenefitId, formData);
      final data = response!.data["data"] as List;
      membershipDataBenefit.value = data
          .map(
            (e) => MembershipDataBenefit.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    } finally {
      update();
      isLoading(false);
    }
  }

  refreshDataMembership() async {
    isLoading(true);
    try {
      final response = await RequestApp.getFutureDio(ApiApps.membershipData);
      final data = response!.data['data'] as List;
      dataMembership.value = data
          .map(
            (e) => MembershipData.fromJson(e),
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
    } finally {
      isLoading(false);
    }
  }
}
