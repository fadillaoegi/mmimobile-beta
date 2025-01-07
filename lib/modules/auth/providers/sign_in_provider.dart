import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:d_method/d_method.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/modules/auth/sources/auth_source.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/widget/alert/alert_dialog_no_action_widget.dart';

class SignInProvider extends ChangeNotifier {
  // NOTE: INITIAL CODE
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObsecure = true;
  bool isLoading = false;

  // NOTE: FUNCTION SING IN
  void signIn(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      String phone = phoneController.text.trim();
      String pass = passController.text.trim();
      final formData = FormData.fromMap({
        "phone": phone,
        "password": pass,
      });
      if (formKey.currentState!.validate()) {
        final result = await AuthSource.signIn(formData);
        // if (result!.isNotEmpty) {
        if (result!["status"] == false) {
          if (result["status_pass_default"]) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialogNoAction(
                // title: "Sign in Success, please edit your password",
                title: result['message'],
                lotties: AssetConfig.lottieSuccess,
                content: "",
              ),
            );
            Timer(
              const Duration(seconds: 3),
              () {
                // goRouter.goNamed(RouteScreen.resetPassword);
                goRouter.pop(context);
              },
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialogNoAction(
                title: result['message'],
                lotties: AssetConfig.lottieSuccess,
                content: "",
              ),
            );
            Timer(
              const Duration(seconds: 3),
              () {
                // goRouter.goNamed(RouteScreen.app);
                goRouter.pop(context);
              },
            );
          }
        } else {
          print("AuthSource: $result");
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialogNoAction(
              title: "Sign in Failed",
              lotties: AssetConfig.lottieFailed,
              content: result["message"],
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () => goRouter.pop(context),
          );
        }
        // }
      }
    } catch (e) {
      DMethod.printTitle("Try ~ signInProvider", e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
