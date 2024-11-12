import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 2,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  AssetConfig.bgLogin3,
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Image.asset(
                                      AssetConfig.logo5,
                                      height: 50.0,
                                    ),
                                  ),
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Sign in to your account\n",
                                    style: white600.copyWith(fontSize: 26.0),
                                  ),
                                  TextSpan(
                                    text: "Welcome to  MMI Mobile",
                                    style: white300.copyWith(fontSize: 22.0),
                                  ),
                                ])),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RouteScreen.forgot);
                                    },
                                    child: Text(
                                      "Forgot Password",
                                      style:
                                          primary600.copyWith(fontSize: 13.0),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            BtnApps(
                              onPress: () {},
                              text: "Sign in",
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: black500.copyWith(fontSize: 13.0),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RouteScreen.codeReveral);
                                  },
                                  child: Text(
                                    "Sign up",
                                    style: primary700.copyWith(fontSize: 13.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
