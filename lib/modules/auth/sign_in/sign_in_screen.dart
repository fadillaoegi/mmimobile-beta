import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  // final _telpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: ColorApps.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 180.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: screenSize.width,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: ColorApps.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Masuk",
                          style: black600.copyWith(fontSize: 24.0),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Email",
                      style: black500.copyWith(fontSize: 16.0),
                    ),
                    FormApps(
                      hint: "example@gmail.com",
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Password",
                      style: black500.copyWith(fontSize: 16.0),
                    ),
                    FormApps(
                      hint: "*****",
                      obsecure: true,
                      activeSuffix: true,
                      controller: _passController,
                      onTapSuffix: () {},
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    BtnDefault(
                      onPress: () {},
                      text: "Masuk",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
