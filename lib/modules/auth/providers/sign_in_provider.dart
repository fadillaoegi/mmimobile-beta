import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:d_method/d_method.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/modules/auth/sources/auth_source.dart';
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
  signIn(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      String phone = phoneController.text.trim();
      String pass = passController.text.trim();
      print(phone);
      print(pass);
      final formData = FormData.fromMap({
        "phone": phone,
        "password": pass,
      });
      if (formKey.currentState!.validate()) {
        final result = await AuthSource.signIn(formData);
        if (result) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialogNoAction(
              title: "Sign in Success",
              lotties: AssetConfig.lottieSuccess,
              content: "",
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () {
              goRouter.goNamed(RouteScreen.app);
            },
          );
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AlertDialogNoAction(
              title: "Sign in Failed",
              lotties: AssetConfig.lottieFailed,
              content: "Incorrect Phone or password",
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pop(context),
          );
        }
      }
    } catch (e) {
      DMethod.printTitle("Try ~ signInProvider", e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
