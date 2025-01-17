import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/color.dart';
import '../controllers/reset_password_controller.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final customerId = '';
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ColorApps.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AssetConfig.logo3,
                        height: 50.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Reset Your Password",
                      style: primary600.copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      "Password must be different than before",
                      textAlign: TextAlign.center,
                      style: black400.copyWith(fontSize: 13.0),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    FormAppsTwo(
                      controller: controller.passController.value,
                      labelText: "New password",
                      obscure: controller.isObsecure.value,
                      suffixIcon: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Password is required";
                        } else if (p0.length < 8) {
                          return "Password must be 8 characters ";
                        }
                        return null;
                      },
                      onTap: () => controller.hidePass(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      controller: controller.confirmPassController.value,
                      labelText: "Confirm Password",
                      obscure: controller.isObsecure.value,
                      suffixIcon: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Confirm password required";
                        } else if (p0 != controller.passController.value.text) {
                          return "passwords are not the same";
                        } else if (p0.length < 8) {
                          return "Password must be 8 characters ";
                        }

                        return null;
                      },
                      onTap: () => controller.hidePass(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BtnApps(
                      onPress: () {
                        controller.resetPassword(context, customerId);
                      },
                      text: "Reset Password",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
