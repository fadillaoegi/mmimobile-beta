import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
// import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class ProfileUpdatePhoneController extends GetxController {
  late final UserController dataUser;
  late final passwordController = TextEditingController().obs;
  late final phoneController = TextEditingController().obs;
  final obsecure = true.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    dataUser = Get.find<UserController>();
    phoneController.value =
        TextEditingController(text: dataUser.user.customerPhone);
  }

  @override
  void onClose() {
    passwordController.value.dispose();
    phoneController.value.dispose();
    super.onClose();
  }

  seeHide() {
    obsecure.value = !obsecure.value;
    update();
  }

  updatePhone(BuildContext context, String customerId) async {
    isLoading.value = true;
    update();
    String passsword = passwordController.value.text.trim();
    String phone = phoneController.value.text.trim();

    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_password': passsword,
      'customer_phone': phone,
    });
    try {
      final result =
          await SourceApps.hitApiToMap(ApiApps.updatePhone, formData);

      passwordController.value.clear();
      // NOTE: HANDLE RESPONSE ID EMPTY
      if (!result!['status']) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Gagal",
            lotties: AssetConfigFLdev.lottieFailed,
            content: "Silahkan masukan password",
          ),
          barrierDismissible: false,
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.back();
          },
        );
        isLoading.value = false;
        update();
        return;
      }

      // NOTE: HANDLE RESPONSE WRONG PASSWORD
      if (result['message'] == 'Invalid password') {
        Get.dialog(
          AlertDialogNoAction(
            title: "Password Salah",
            lotties: AssetConfigFLdev.lottieFailed,
            content: "",
          ),
          barrierDismissible: false,
        );

        Future.delayed(
          Duration(seconds: 2),
          () => Get.back(),
        );

        isLoading.value = false;
        update();
        return;
      }

      // NOTE: HANDLE RESPONSE SUCCESS
      Future.delayed(
        const Duration(seconds: 3),
        () {
          User user = User.fromJson(result['data']);
          SessionUserFLdev.saveUser(user);
        },
      );

      Get.dialog(
        AlertDialogNoAction(
          title: "Berhasil",
          lotties: AssetConfigFLdev.lottieSuccess,
          content: "Ubah Profil",
        ),
        barrierDismissible: false,
      );

      Future.delayed(
        Duration(seconds: 2),
        () => Get.back(),
      );
      // SnackbarFLdev.snackShow(
      //     title: "Success update", message: "Phone updated");

      isLoading.value = false;
      update();
    } catch (e) {
      DMethod.printTitle('Try ~ from Controller', e.toString());
      isLoading.value = true;
      update();
    }
  }
}
