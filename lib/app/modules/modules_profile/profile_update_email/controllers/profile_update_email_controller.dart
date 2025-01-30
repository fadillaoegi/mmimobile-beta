import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ProfileUpdateEmailController extends GetxController {
  late final UserController dataUser;

  late final emailController = TextEditingController().obs;
  late final passwordController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final isLoading = false.obs;
  final obsecure = true.obs;
  @override
  void onInit() {
    super.onInit();
    dataUser = Get.find<UserController>();
    emailController.value =
        TextEditingController(text: dataUser.user.customerEmail);
    passwordController.value = TextEditingController();
  }

  @override
  void onClose() {
    emailController.value.clear();
    passwordController.value.clear();
    emailController.close();
    passwordController.close();
    super.onClose();
  }

  seeHide() {
    obsecure.value = !obsecure.value;
    update();
  }

  updateEmail(BuildContext context, String customerId) async {
    isLoading.value = true;
    update();

    String email = emailController.value.text.trim();
    String password = passwordController.value.text.trim();
    print("Try hahah ~ $email");
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_password': password,
      'customer_email': email,
      'type': 'update',
    });

    try {
      final result =
          await SourceApps.hitApiToMap(ApiApps.updateEmail, formData);
      // print(result!['status']);

      // NOTE: HANDLE RESPONSE ID EMPTY
      if (!result!['status']) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Update email failed",
            lotties: AssetConfigFLdev.lottieFailed,
            content: result['message'],
          ),
          barrierDismissible: false,
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.back();
          },
        );
      }

      // NOTE: HANDLE RESPONSE WRONG PASSWORD
      if (result['message'] == 'Invalid password') {
        Get.dialog(
          AlertDialogNoAction(
            title: "Update email failed",
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
      Get.dialog(
        AlertDialogNoAction(
          title: "Email updated",
          lotties: AssetConfigFLdev.lottieSuccess,
          content: "",
        ),
        barrierDismissible: false,
      );

      Future.delayed(
        const Duration(seconds: 2),
        () {
          User user = User.fromJson(result['data']);
          SessionUserFLdev.saveUser(user);
          Get.back();
          Get.back();
        },
      );

      isLoading.value = false;
      update();
    } catch (e) {
      DMethod.printTitle("Try ~ fromController", e.toString());
      isLoading.value = false;
      update();
    }
  }
}
