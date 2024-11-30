import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/widget/alert/alert_dialog_no_action_widget.dart';

class OtpForgotProvider extends ChangeNotifier {
  final otpCodeC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  String staticCode = "000000";

  void clearTextController() {
    otpCodeC.clear();
    notifyListeners();
  }

  otpVerification(BuildContext context, String code, String emailUser) {
    
    if (code == staticCode) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialogNoAction(
          lotties: AssetConfig.lottieSuccess,
          title: "Verification successful",
        ),
      );
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushNamed(context, RouteScreen.resetPassword,
              arguments: emailUser);
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialogNoAction(
          lotties: AssetConfig.lottieFailed,
          title: "Verification failed",
        ),
      );
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pop(context),
      );
    }
    clearTextController();
  }

  @override
  void dispose() {
    super.dispose();
    otpCodeC.dispose();
    focusNode.dispose();
  }
}
