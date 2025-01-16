import 'dart:async';
import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/api/api.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/sources/source_apps.dart';
import 'package:mmimobile/widget/alert/alert_dialog_no_action_widget.dart';

class ResetPasswordProvider extends ChangeNotifier {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecure = true;
  bool isLoading = false;

  void hidePass() {
    isObsecure = !isObsecure;
    notifyListeners();
  }

  void resetPassword(BuildContext context, String customerId) async {
    isLoading;
    notifyListeners();
    String password = passController.text.trim();
    final formData = FormData.fromMap({
      'customer_id': customerId,
      'customer_password': password,
    });

    try {
      if (formKey.currentState!.validate()) {
        final result =
            await SourceApps.hitApiToMap(ApiApps.resetPassword, formData);
        // result!.isNotEmpty ? result : null;

        if (customerId.isEmpty) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialogNoAction(
              title: "Reset password failed",
              lotties: AssetConfig.lottieFailed,
              content: "You are not yet a customer.",
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () {
              goRouter.pop(context);
            },
          );
          isLoading = false;
          notifyListeners();
          return;
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AlertDialogNoAction(
            title: "Reset password success",
            lotties: AssetConfig.lottieSuccess,
            content: "Silahkan login lagi",
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () {
            goRouter.pop(context);
            Timer(
              const Duration(seconds: 2),
              () {
                goRouter.goNamed(RouteScreen.app);
              },
            );
          },
        );
      }
    } catch (e) {
      DMethod.printTitle("Try ~ ResetPassProvider", e.toString());
    }
    isLoading;
    notifyListeners();
  }
}
