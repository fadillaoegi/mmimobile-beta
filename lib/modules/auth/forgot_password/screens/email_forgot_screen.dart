import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';

class EmailForgotScreen extends StatefulWidget {
  const EmailForgotScreen({super.key});

  @override
  State<EmailForgotScreen> createState() => _EmailForgotScreenState();
}

class _EmailForgotScreenState extends State<EmailForgotScreen> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            focusNode.requestFocus();
          },
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
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
                        "Forgot Password",
                        style: primary600.copyWith(fontSize: 16.0),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        "Enter you email account to reset password",
                        style: black400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Image.asset(AssetConfig.ilForgotPass),
                      const SizedBox(
                        height: 40.0,
                      ),
                      FormAppsTwo(
                        controller: _emailController,
                        labelText: "Email",
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      BtnApps(
                        onPress: () {},
                        text: "Send Code",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
