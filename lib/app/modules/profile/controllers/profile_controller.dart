import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ProfileController extends GetxController {
  final emailController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode().obs;
  final _emailStatic = "example@gmail.com".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

// NOTE: FUNCTION
  emailForgot(BuildContext context) {
    final email = emailController.value.text;
    if (formKey.currentState!.validate()) {
      if (email != _emailStatic.value) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Your email is not registered",
            content: email,
            lotties: AssetConfig.lottieFailed,
          ),
          barrierDismissible: false,
        );

        Timer(
          const Duration(seconds: 3),
          () => Get.back(),
          // () => Navigator.pop(context),
        );
      } else {
        Get.dialog(
          const AlertDialogNoAction(
            title: "code sent to your email",
            lotties: AssetConfig.lottieSuccess,
          ),
          barrierDismissible: false,
        );

        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pop(context);
            Timer(
              const Duration(seconds: 1),
              () {
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
