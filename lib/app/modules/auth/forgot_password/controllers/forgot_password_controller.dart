import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode().obs;
  final _emailStatic = "example@gmail.com".obs;
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
  emailForgot(BuildContext context) {
    final email = emailController.value.text.trim();
    if (formKey.currentState!.validate()) {
      if (email != _emailStatic.value) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Your email is not registered",
            content: email,
            lotties: AssetConfig.lottieFailed,
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () => Get.back(),
        );
      } else {
        Get.dialog(
          AlertDialogNoAction(
            title: "Code OTP sent to your email",
            content: email,
            lotties: AssetConfig.lottieSuccess,
          ),
        );

        Timer(
          const Duration(seconds: 3),
          () {
            Get.back();
            Timer(
              const Duration(seconds: 1),
              () {
                // Navigator.pushNamed(context, RouteScreen.otpForgot,
                //     arguments: email);
                Get.toNamed(Routes.otp, arguments: email);
              },
            );
          },
        );
      }
    }
    emailController.value.clear();
  }
}
