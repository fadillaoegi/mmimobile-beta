import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  // final _telpController = TextEditingController();
  // final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          color: ColorApps.primary2,
          child: Stack(
            children: [
              // NOTE: BG
              Container(
                height: sizeScreen.height / 1.5,
                width: sizeScreen.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetConfig.bgLogin2),
                      fit: BoxFit.cover),
                ),
              ),

              // NOTE: CONTENT
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: sizeScreen.height / 18,
                    ),
                    // NOTE: LOGO
                    Image.asset(
                      AssetConfig.logo5,
                      height: 92.0,
                    ),
                    SizedBox(
                      height: sizeScreen.height / 6,
                    ),
                    Text(
                      "Hai, BeautyPreanure!!",
                      style: white700.copyWith(fontSize: 30.0),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Hello there, login to continue",
                        style: white500.copyWith(fontSize: 18.0),
                      ),
                    ),

                    // NOTE: CARD FORM
                    Container(
                      padding: const EdgeInsets.all(30.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 24.0),
                      decoration: BoxDecoration(
                          color: ColorApps.white,
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 57, 56, 56)
                                  .withOpacity(0.5), // Warna shadow
                              spreadRadius: 5, // Seberapa jauh shadow menyebar
                              blurRadius: 7, // Seberapa halus blur shadow
                              offset:
                                  const Offset(3, 3), // Offset shadow (X, Y)
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: sizeScreen.width,
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome to  MMI Mobile ",
                                    style: primary700.copyWith(fontSize: 22.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "Hello there, login to continue",
                                    textAlign: TextAlign.center,
                                    style: primary500.copyWith(fontSize: 14.0),
                                  ),
                                ],
                              )),
                          FormAppsTwo(
                            controller: _emailController,
                            labelText: "Email",
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          FormAppsTwo(
                            controller: _passController,
                            labelText: "Password",
                            obscure: _isObsecure,
                            suffixIcon: true,
                            onTap: () {
                              setState(() {
                                _isObsecure = !_isObsecure;
                              });
                            },
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          // NOTE: FORGOT PASS
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteScreen.forgot);
                                  },
                                  child: Text(
                                    "Lupa Password",
                                    style: primary600.copyWith(fontSize: 14.0),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BtnDefault(
                            onPress: () {
                              focusNode.unfocus();
                            },
                            text: "Masuk",
                          ),

                          const SizedBox(
                            height: 10.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don’t have an account?",
                                style: black500.copyWith(fontSize: 14.0),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Register Now",
                                  style: primary700.copyWith(fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
