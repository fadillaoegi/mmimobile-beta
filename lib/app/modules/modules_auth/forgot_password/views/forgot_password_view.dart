import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    final sizeScreen = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => controller.focusNode.value.requestFocus(),
      child: Scaffold(
        appBar: AppBarAppFLdev(
          title: "Lupa Password",
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Kami akan mengirimkan 6 digit code \nalamat ke email anda",
                            textAlign: TextAlign.center,
                            style: black400.copyWith(fontSize: 16.0),
                          ),
                          SizedBox(
                            height: sizeScreen.height / 28,
                          ),
                          Center(
                            child: Image.asset(
                              AssetConfigFLdev.ilForgotPass,
                              height: 300.0,
                            ),
                          ),
                          SizedBox(
                            height: sizeScreen.height / 24,
                          ),
                          Form(
                            key: controller.formKey,
                            child: FormAppsTwo(
                              controller: controller.emailController.value,
                              labelText: "Email",
                              validator: (p0) {
                                if (p0!.isEmpty || p0 == "") {
                                  return "Email is required ";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: sizeScreen.height / 28,
                          ),
                          Text(
                            "Jika anda lupa email yang terdaftar silakan kirim email ke ",
                            textAlign: TextAlign.center,
                            style: black400.copyWith(fontSize: 14.0),
                          ),
                          Text(
                            "info@mashmoshem.co.id",
                            textAlign: TextAlign.center,
                            style: black700.copyWith(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      BtnApps(
                        onPress: () => controller.emailForgot(context),
                        text: "kirim",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
