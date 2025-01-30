import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final emailController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode().obs;
  // final _emailStatic = "example@gmail.com".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

// NOTE: FUNCTION
  // emailForgot(BuildContext context) {
  //   final email = emailController.value.text;

  //   if (formKey.currentState!.validate()) {
  //     if (email != _emailStatic.value) {
  //       Get.dialog(
  //         AlertDialogNoAction(
  //           title: "Your email is not registered",
  //           content: email,
  //           lotties: AssetConfigFLdev.lottieFailed,
  //         ),
  //         barrierDismissible: false,
  //       );

  //       Future.delayed(
  //         Duration(seconds: 3),
  //         () => Get.back(),
  //       );

  //     } else {
  //       Get.dialog(
  //         const AlertDialogNoAction(
  //           title: "code sent to your email",
  //           lotties: AssetConfigFLdev.lottieSuccess,
  //         ),
  //         barrierDismissible: false,
  //       );

  //       Timer(
  //         const Duration(seconds: 3),
  //         () {
  //           Navigator.pop(context);
  //           Timer(
  //             const Duration(seconds: 1),
  //             () {
  //               Get.toNamed(Routes.otp, arguments: email);
  //             },
  //           );
  //         },
  //       );
  //     }
  //   }
  //   emailController.value.clear();
  // }
}
