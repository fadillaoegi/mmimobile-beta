import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/modules/auth/sign_in/providers/sign_in_provider.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final signProvider = Provider.of<SignInProvider>(context);
    return GestureDetector(
      onTap: () {
        signProvider.focusNode.unfocus();
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
                        key: signProvider.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormAppsTwo(
                              controller: signProvider.emailController,
                              labelText: "Email",
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            FormAppsTwo(
                              controller: signProvider.passController,
                              labelText: "Password",
                              obscure: signProvider.isObsecure,
                              suffixIcon: true,
                              onTap: () {
                                setState(() {
                                  signProvider.isObsecure =
                                      !signProvider.isObsecure;
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
                              onPress: () {
                                String emailC =
                                    signProvider.emailController.text;
                                String passC = signProvider.passController.text;
                                if (emailC.toString() == signProvider.email &&
                                    passC.toString() == signProvider.password) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RouteScreen.app,
                                    (route) => false,
                                  );
                                } else {
                                  
                                }
                              },
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
