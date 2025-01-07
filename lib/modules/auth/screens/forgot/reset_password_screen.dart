import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/modules/auth/providers/forgot/reset_password_provider.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final resetPassP = Provider.of<ResetPasswordProvider>(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: resetPassP.formKey,
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
                      controller: resetPassP.passController,
                      labelText: "New password",
                      obscure: resetPassP.isObsecure,
                      suffixIcon: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      onTap: () => resetPassP.hidePass(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FormAppsTwo(
                      controller: resetPassP.confirmPassController,
                      labelText: "Confirm Password",
                      obscure: resetPassP.isObsecure,
                      suffixIcon: true,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Confirm password required";
                        } else if (p0 != resetPassP.passController.text) {}

                        return null;
                      },
                      onTap: () => resetPassP.hidePass(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BtnApps(
                      onPress: () {
                        resetPassP.resetPassword(context);
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
