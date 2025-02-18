import 'dart:async';
import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class SignInController extends GetxController {
  // NOTE: INITIAL CODE
  Rx<FocusNode> focusNode = FocusNode().obs;
  GlobalKey<FormState> formKey = GlobalKey();
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final isObsecure = true.obs;

  Rx<bool> isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // NOTE: FUNCTION
  hideSeePass() {
    isObsecure.value = !isObsecure.value;
    // update();
  }

  void signIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    String phone = phoneController.value.text.trim();
    String pass = passController.value.text.trim();

    isLoading.value = true;
    update();
    if (phone.isEmpty && pass.isEmpty) {
      Get.dialog(
        AlertDialogNoAction(
          title: "Sign in failed",
          lotties: AssetConfigFLdev.lottieFailed,
          content: "Phone and password are required",
        ),
        barrierDismissible: false,
      );
      Future.delayed(
        const Duration(seconds: 3),
        () => Get.back(),
      );
      // isLoading.value = false;
      // update();
      return;
    }
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "password": pass,
      });

      final result = await SourceApps.hitApiToMap(ApiApps.signIn, formData);

      result!.isNotEmpty ? result : null;

      // NOTE: HANDLE RESPONSE WRONG PASSWORD
      if (result['message'] == 'Invalid password') {
        Get.dialog(
          AlertDialogNoAction(
            title: "Sign in failed",
            lotties: AssetConfigFLdev.lottieFailed,
            content: result['message'],
          ),
          barrierDismissible: false,
        );

        Future.delayed(
          Duration(seconds: 2),
          () => Get.back(),
        );

        // isLoading.value = false;
        // update();
        return;
      }

      // NOTE: HANDLE RESPONSE STATUS TRUE
      if (result["status"]) {
        // NOTE: HANDLE RESPONSE STATUS PASS DEFAULT
        if (result["status_pass_default"]) {
          bool customerStatus = result['data']["customer_status"];
          if (!customerStatus) {
            Get.dialog(
              AlertDialogNoAction(
                title: "Sign in failed",
                lotties: AssetConfigFLdev.lottieFailed,
                content: "You are not yet a customer.",
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
          Get.dialog(
            AlertDialogNoAction(
              title: "Sign in success",
              lotties: AssetConfigFLdev.lottieSuccess,
              content: result['message'],
            ),
            barrierDismissible: false,
          );

          Future.delayed(
            Duration(seconds: 2),
            () {
              String customerId = result['data']['customer_id'];
              Get.back();
              Get.toNamed(Routes.resetPassword,
                  arguments: customerId.toString());
            },
          );
          // return;
        } else {
          // NOTE: HANDLE RESPONSE EMAIL NOT FOUND
          if (result['data']['customer_email'] == null ||
              result['data']['customer_email'] == '') {
            Get.dialog(
              AlertDialogNoAction(
                title: "Signin success",
                lotties: AssetConfigFLdev.lottieSuccess,
                content: "You don't have email, please enter your email",
              ),
              barrierDismissible: false,
            );
            Future.delayed(
              const Duration(seconds: 2),
              () {
                String customerId = result['data']['customer_id'];
                Get.back();
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    Get.toNamed(Routes.addEmail, arguments: customerId);
                  },
                );
              },
            );
            return;
          }

          // NOTE: HANDLE RESPONSE SUCCCESS
          Get.dialog(
            AlertDialogNoAction(
              title: "Sign Success",
              lotties: AssetConfigFLdev.lottieSuccess,
              content: "Welcome to Mmimobile",
            ),
            barrierDismissible: false,
          );

          Future.delayed(
            const Duration(seconds: 3),
            () {
              User user = User.fromJson(result['data']);
              SessionUserFLdev.saveUser(user);
              Get.back();
              Future.delayed(
                const Duration(seconds: 1),
                () {
                  Get.offAllNamed(Routes.appMain);
                },
              );
            },
          );
          // isLoading.value = false;
          // update();
          return;
        }
      } else {
        // NOTE: HANDLE RESPONSE NOT REGISTERED
        Get.dialog(
          AlertDialogNoAction(
            title: "Sign in Failed",
            lotties: AssetConfigFLdev.lottieFailed,
            content: "Your not resgisterd",
          ),
          barrierDismissible: false,
        );

        Future.delayed(
          const Duration(seconds: 3),
          () => Get.back(),
        );
      }
    } catch (e) {
      DMethod.printTitle("Try ~ signInProvider", e.toString());
    } finally {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          update();
        },
      );
    }
    isLoading.value = false;
    update();
  }
}
