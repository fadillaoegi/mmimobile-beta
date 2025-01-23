import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:d_method/d_method.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class ProfileEditPasswordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final isObsecure = true.obs;
  final isObsecureSecond = true.obs;
  final isObsecureThird = true.obs;
  final oldPassController = TextEditingController().obs;
  final newPassController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();

  hidePass() {
    isObsecure.value = !isObsecure.value;
    update();
  }

  hidePassSecond() {
    isObsecureSecond.value = !isObsecureSecond.value;
    update();
  }

  hidePassThird() {
    isObsecureThird.value = !isObsecureThird.value;
    update();
  }

  editPassword(BuildContext context, String customerId) async {
    if (formKey.currentState!.validate()) {
      final oldPassword = oldPassController.value.text;
      final newPassword = newPassController.value.text;
      // final confirmPassword = confirmPassController.value.text;

      final formData = FormData.fromMap({
        'customer_id': customerId,
        'customer_password_old': oldPassword,
        'customer_password': newPassword,
      });

      try {
        final result =
            await SourceApps.hitApiToMap(ApiApps.updatePassword, formData);

        // NOTE: CHECKING CUTOMER_ID
        if (!result!['status']) {
          Get.dialog(
            AlertDialogNoAction(
              title: "Edit password failed",
              lotties: AssetConfig.lottieFailed,
              content: result['message'],
            ),
            barrierDismissible: false,
          );
          Future.delayed(Duration(seconds: 2), () => Get.back());
          return;
        }

        // NOTE: CHECKING PASSWORD OLD
        if (result['message'] == 'Invalid old password') {
          Get.dialog(
            AlertDialogNoAction(
              title: "Edit password failed",
              lotties: AssetConfig.lottieFailed,
              content: result['message'],
            ),
            barrierDismissible: false,
          );
          Future.delayed(Duration(seconds: 2), () => Get.back());
          return;
        }

        // NOTE: EXECUTE EDIT PASSWORD
        User user = User.fromJson(result['data']);
        bool successUpdate = await SessionUser.saveUser(user);
        print(successUpdate);

        if (successUpdate) {
          Get.dialog(
            AlertDialogNoAction(
              title: "Password updated",
              lotties: AssetConfig.lottieSuccess,
              content: "",
            ),
            barrierDismissible: false,
          );
          Future.delayed(Duration(seconds: 2), () => Get.back());
        }
      } catch (e) {
        DMethod.printTitle('Try ~ editPasswordController', e.toString());
      }
    }
  }
}
