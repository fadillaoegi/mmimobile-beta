import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> refreshUserData() async {
    try {
      isLoading.value = true;

      // Ambil data terbaru dari session (bisa dari API)
      User? updatedUser = await SessionUserFLdev.getUser();

      if (updatedUser != null) {
        final userController = Get.put(UserController());
        userController.setData(updatedUser);
      }
    } catch (e) {
      print("Error refreshing user data: $e");
    } finally {
      isLoading.value = false;
    }
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
