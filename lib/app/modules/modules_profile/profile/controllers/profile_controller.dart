import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
import 'package:mmimobile/app/helpers/refresh_data_fldev.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final userData = Get.put(UserController());
  final membershipData = MembershipData().obs;
  var clickCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMembershipDataId();
  }

  // NOTE: fetch data memebrship Id
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

  // NOTE: refresh data
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

  void cr(BuildContext context) {
    clickCount++;

    if (clickCount.value >= 30) {
      Get.snackbar(
        "FLdev copyright",
        "This application was developed by FLdev",
        snackPosition: SnackPosition.BOTTOM,
        colorText: ColorApps.secondary,
      );
      clickCount.value = 0;
    }
    update();
  }
}
