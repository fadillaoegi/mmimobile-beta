import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/widget/alert/alert_dialog_no_action_widget.dart';

class ForgotPassProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();

  final _emailStatic = "example@gmail.com";

  // NOTE: FUNCTION
  emailForgot(BuildContext context) {
    String email = emailController.text;
    if (formKey.currentState!.validate()) {
      if (email != _emailStatic) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogNoAction(
            title: "Your email $email is not registered",
            lotties: AssetConfig.lottieFailed,
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pop(context),
        );
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialogNoAction(
          title: "Your email $email is not registered",
          lotties: AssetConfig.lottieFailed,
        ),
      );
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pop(context);
          Timer(
            const Duration(seconds: 1),
            () {
              Navigator.pushNamed(context, RouteScreen.otpForgot,
                  arguments: email);
            },
          );
        },
      );
    }
  }
}
