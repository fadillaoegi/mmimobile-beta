import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
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
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class ProfileUpdateAddressController extends GetxController {
  late final UserController dataUser;
  late final passwordController = TextEditingController().obs;
  late final addressController = TextEditingController().obs;
  final isLoading = false.obs;
  final obsecureText = true.obs;
  @override
  void onInit() {
    super.onInit();
    dataUser = Get.find<UserController>();
    addressController.value =
        TextEditingController(text: dataUser.user.customerAddress);
  }

  @override
  void onClose() {
    passwordController.value.dispose();
    super.onClose();
  }

  seeHide() {
    obsecureText.value = !obsecureText.value;
    update();
  }

  updateAdress(BuildContext context, String customerId) async {
    isLoading.value = true;
    update();
    String password = passwordController.value.text.trim();
    String address = addressController.value.text.trim();
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_address': address,
      'customer_password': password,
    });
    try {
      final result =
          await SourceApps.hitApiToMap(ApiApps.updateAdress, formData);
      passwordController.value.clear();

      // NOTE: HANDLE RESPONSE ID EMPTY
      if (!result!['status']) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Update address failed",
            lotties: AssetConfigFLdev.lottieFailed,
            content: result['message'],
          ),
          barrierDismissible: false,
        );
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.back(),
        );
        isLoading.value = false;
        update();
        return;
      }

      // NOTE: HANDLE RESPONSE WRONG PASSWORD
      if (result['message'] == 'Invalid password') {
        Get.dialog(
          AlertDialogNoAction(
            title: "Update address failed",
            lotties: AssetConfigFLdev.lottieFailed,
            content: result['message'],
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
      SnackbarFLdev.snackShow(
          title: "Success update", message: "Address updated");

      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }
}
