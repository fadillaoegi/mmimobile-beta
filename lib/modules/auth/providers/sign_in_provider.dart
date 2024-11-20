import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/widget/alert/alert_dialog_no_action_widget.dart';

class SignInProvider extends ChangeNotifier {
  FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObsecure = true;

  // NOTE: DATA STATIS
  final _emailStatic = "example@gmail.com";
  // String get email => _emailStatic;
  final _passwordStatic = "11111111";
  // String get password => _passwordStatic;

  // NOTE: FUNCTION SING IN
  signIn(BuildContext context) {
    String emailC = emailController.text;
    String passC = passController.text;
    if (formKey.currentState!.validate()) {
      if (emailC.contains("@")) {
        if (emailC.toString() == _emailStatic &&
            passC.toString() == _passwordStatic) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialogNoAction(
              title: "Sign in Success",
              lotties: AssetConfig.lottieSuccess,
              content: "",
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteScreen.app,
                (route) => false,
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => const AlertDialogNoAction(
              title: "Sign in Failed",
              lotties: AssetConfig.lottieFailed,
              content: "Incorrect email or password",
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pop(context),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialogNoAction(
            title: "Incorrect email format",
            lotties: AssetConfig.lottieFailed,
            content: "",
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pop(context),
        );
      }
    }
  }
}
