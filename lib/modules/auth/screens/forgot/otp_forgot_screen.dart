import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/modules/auth/providers/forgot/otp_forgot_provider.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:provider/provider.dart';

class OtpForgotScreen extends StatefulWidget {
  const OtpForgotScreen({super.key});

  @override
  State<OtpForgotScreen> createState() => _OtpForgotScreenState();
}

class _OtpForgotScreenState extends State<OtpForgotScreen> {
  @override
  Widget build(BuildContext context) {
    String emailUser = ModalRoute.settingsOf(context)!.arguments as String;
    final otpForgotP = Provider.of<OtpForgotProvider>(context);
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            otpForgotP.focusNode.requestFocus();
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
                        "Enter Verification Code",
                        style: primary600.copyWith(fontSize: 16.0),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        "OTP code has been sent to the email address",
                        textAlign: TextAlign.center,
                        style: black400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        emailUser.isEmpty ? "example@gmail.com." : emailUser,
                        textAlign: TextAlign.center,
                        style: primary400.copyWith(fontSize: 13.0),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      OtpTextField(
                        onSubmit: (String value) {
                          otpForgotP.otpCodeC.text = value;
                          if (value == otpForgotP.staticCode) {
                            Navigator.pushNamed(
                                context, RouteScreen.resetPassword);
                          }
                        },
                        numberOfFields: 6,
                        borderWidth: 2.0,
                        obscureText: true,
                        clearText: true,
                        focusedBorderColor: ColorApps.primary,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn’t you receive any code?",
                            style: black500.copyWith(fontSize: 13.0),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Resend Code",
                                style: primary500.copyWith(fontSize: 13.0),
                              ))
                        ],
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
