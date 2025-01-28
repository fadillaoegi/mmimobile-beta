import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:d_method/d_method.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ProfileEditNameController extends GetxController {
  final count = 0.obs;
  final newNameController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final isLoading = false.obs;
  final obsecure = true.obs;
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
    newNameController.close();
    passController.close();
    newNameController.value.clear();
    passController.value.clear();
    super.onClose();
  }

  seeHide() {
    obsecure.value = !obsecure.value;
    update();
  }

  editName(BuildContext context, customerId) async {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      final customerName = newNameController.value.text.trim();
      final password = passController.value.text.trim();
      final formData = FormData.fromMap({
        'customer_id': customerId,
        'customer_password': password,
        'customer_name': customerName,
      });
      print(password);
      passController.value.clear();
      try {
        final result =
            await SourceApps.hitApiToMap(ApiApps.updateName, formData);

        // NOTE: HANDLE RESPONSE ID EMPTY
        if (!result!['status']) {
          Get.dialog(
            AlertDialogNoAction(
              title: "Update name failed",
              lotties: AssetConfig.lottieFailed,
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
          isLoading.value = false;
          update();
          return;
        }

        // NOTE: HANDLE RESPONSE WRONG PASSWORD
        if (result['message'] == 'Invalid password') {
          Get.dialog(
            AlertDialogNoAction(
              title: "Sign in failed",
              lotties: AssetConfig.lottieFailed,
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
            title: "Name updated",
            lotties: AssetConfig.lottieSuccess,
            content: "",
          ),
          barrierDismissible: false,
        );

        Future.delayed(
          const Duration(seconds: 2),
          () {
            User user = User.fromJson(result['data']);
            SessionUser.saveUser(user);
            Get.back();
            Future.delayed(
              const Duration(seconds: 2),
              () {
                isLoading.value = false;
                update();
              },
            );
          },
        );
        return;
      } catch (e) {
        DMethod.printTitle('Try ~ fromProfileNameController', e.toString());
        isLoading.value = false;
        update();
      }
    }
  }
}
