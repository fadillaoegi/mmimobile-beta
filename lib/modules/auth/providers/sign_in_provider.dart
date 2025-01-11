import 'dart:async';
import 'package:d_method/d_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/api/api.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/sources/source_apps.dart';
import 'package:mmimobile/routes/initial_routes.dart';
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
    if (!formKey.currentState!.validate()) {
      return;
    }
    String phone = phoneController.text.trim();
    String pass = passController.text.trim();
    isLoading = true;
    notifyListeners();
    if (phone.isEmpty && pass.isEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const AlertDialogNoAction(
          // title: "Sign in Success, please edit your password",
          title: "Sign in failed",
          lotties: AssetConfig.lottieSuccess,
          content: "Phone and password are required",
        ),
      );
      Timer(
        const Duration(seconds: 3),
        () {
          // goRouter.goNamed(RouteScreen.resetPassword);
          goRouter.pop(context);
        },
      );
      isLoading = false;
      notifyListeners();
    }
    try {
      final formData = FormData.fromMap({
        "phone": phone,
        "password": pass,
      });

      final result = await SourceApps.hitApiToMap(ApiApps.signIn, formData);

      result!.isNotEmpty ? result : null;

      // NOTE: HANDLE RESPONSE WRONG PASSWORD
      if (result['message'] == 'Invalid password') {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialogNoAction(
            title: "Sign in failed",
            lotties: AssetConfig.lottieFailed,
            content: result['message'],
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () {
            // goRouter.goNamed(RouteScreen.resetPassword);
            goRouter.pop(context);
          },
        );
        isLoading = false;
        notifyListeners();
        return;
      }

      // NOTE: HANDLE RESPONSE STATUS TRUE
      if (result["status"]) {
        // print(result["data"]["customer_status"]);
        // NOTE: HANDLE RESPONSE STATUS PASS DEFAULT
        if (result["status_pass_default"]) {
          bool customerStatus = result['data']["customer_status"];
          if (!customerStatus) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const AlertDialogNoAction(
                title: "Sign in failed",
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
            builder: (context) => AlertDialogNoAction(
              title: "Sign in success",
              lotties: AssetConfig.lottieSuccess,
              content: result['message'],
            ),
          );
          Timer(
            const Duration(seconds: 3),
            () {
              goRouter.goNamed(RouteScreen.resetPassword);
              goRouter.pop(context);
            },
          );
          // return;
        } else {
          // NOTE: HANDLE RESPONSE SUCCCESS
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
              goRouter.goNamed(RouteScreen.app);
              // goRouter.pop(context);
            },
          );
          return;
        }
      } else {
        print("AuthSource: $result");
        // NOTE: HANDLE RESPONSE NOT REGISTERED
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AlertDialogNoAction(
            title: "Sign in Failed",
            lotties: AssetConfig.lottieFailed,
            content: "Your not resgisterd",
          ),
        );
        Timer(
          const Duration(seconds: 3),
          () => goRouter.pop(context),
        );
      }
    } catch (e) {
      DMethod.printTitle("Try ~ signInProvider", e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
