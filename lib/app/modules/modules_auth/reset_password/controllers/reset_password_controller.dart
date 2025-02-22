import 'dart:async';
import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ResetPasswordController extends GetxController {
  final passController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final isObsecure = true.obs;
  final isObsecureSecond = true.obs;
  final isLoading = false.obs;

  void hidePass() {
    isObsecure.value = !isObsecure.value;
    update();
  }

  void hidePassSecond() {
    isObsecureSecond.value = !isObsecureSecond.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  // NOTE: FUNCTION
  void resetPassword(BuildContext context, String customerId) async {
    isLoading.value;
    update();

    String password = passController.value.text.trim();
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_password': password,
    });

    try {
      if (formKey.currentState!.validate()) {
        final result =
            await SourceApps.hitApiToMap(ApiApps.resetPassword, formData);

        result!.isNotEmpty ? result : null;

        // bool checkCustomer =
        //     int.parse(result['data']['customer_type_id']) > 1 ? false : true;
        bool customerType =
            int.tryParse(result['data']['customer_type_id'])! > 1
                ? true
                : false;
        print(customerType);
        if (customerType) {
          Get.dialog(
            const AlertDialogNoAction(
              title: "Reset password failed",
              lotties: AssetConfigFLdev.lottieFailed,
              content: "You are not yet a customer.",
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

        if (result['data']['customer_email'].toString().isEmpty &&
            result['data']['customer_email'].toString() == '-') {
          print(result['data']['customer_email'].toString());
          Get.dialog(
            const AlertDialogNoAction(
              title: "Password update successfully",
              lotties: AssetConfigFLdev.lottieSuccess,
              content: "Your not have email, \n please enter your email.",
            ),
            barrierDismissible: false,
          );
          Future.delayed(
            const Duration(seconds: 3),
            () {
              String customerId = result['data']['customer_id'];
              Get.back();
              Get.offAllNamed(Routes.addEmail, arguments: customerId);
            },
          );

          isLoading.value = false;
          update();
          return;
        }

        Get.dialog(
          const AlertDialogNoAction(
            title: "Welcome to Mmimpbile",
            lotties: AssetConfigFLdev.lottieSuccess,
            content: "Reset password success",
          ),
          barrierDismissible: false,
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.back();
            Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.offAllNamed(Routes.appMain);
              },
            );
          },
        );
      }
    } catch (e) {
      DMethod.printTitle("Try ~ ResetPassProvider", e.toString());
    }
    isLoading.value;
    update();
  }
}
