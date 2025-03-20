import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';

class AddEmailController extends GetxController {
  final emailController = TextEditingController().obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final focusNode = FocusNode().obs;
  @override
  void onInit() {
    super.onInit();
  }

  addEmail(BuildContext context, String customerId) async {
    final email = emailController.value.text.trim();
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_email': email,
      'type': 'add',
    });
    try {
      if (formKey.currentState!.validate()) {
        final result =
            await SourceApps.hitApiToMap(ApiApps.updateEmail, formData);

        if (!result!['status']) {
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
          return;
        }
        Get.dialog(
          AlertDialogNoAction(
            title: "Welcome to mmimobile",
            lotties: AssetConfigFLdev.lottieSuccess,
            content: result['message'],
          ),
          barrierDismissible: false,
        );

        Future.delayed(
          Duration(seconds: 2),
          () {
            User user = User.fromJson(result['data']);
            SessionUserFLdev.saveUser(user);
            Future.delayed(
              Duration(seconds: 2),
              () {
                Get.offAllNamed(Routes.appMain);
                Get.back();
              },
            );
          },
        );
      }
    } catch (e) {
      DMethod.printTitle("Try~controllerEmail", e.toString());
    }
  }
}
