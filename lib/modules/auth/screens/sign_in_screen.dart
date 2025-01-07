import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/modules/auth/providers/sign_in_provider.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);

    return GestureDetector(
      onTap: () {
        signInProvider.focusNode.unfocus();
      },
      child: ModalProgressHUD(
        inAsyncCall: signInProvider.isLoading,
        progressIndicator: const CupertinoActivityIndicator(),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    AssetConfig.bgLogin3,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      text: "Welcome to MMI Mobile",
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
                          key: signInProvider.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormAppsTwo(
                                controller: signInProvider.phoneController,
                                labelText: "Phone",
                                keybooardType: TextInputType.phone,
                                validator: (p0) {
                                  if (p0!.isEmpty || p0 == "") {
                                    return "Email is required ";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              FormAppsTwo(
                                controller: signInProvider.passController,
                                labelText: "Password",
                                obscure: signInProvider.isObsecure,
                                suffixIcon: true,
                                validator: (p0) {
                                  if (p0!.isEmpty || p0 == "") {
                                    return "Password is required ";
                                  }
                                  return null;
                                },
                                onTap: () {
                                  setState(() {
                                    signInProvider.isObsecure =
                                        !signInProvider.isObsecure;
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
                                        // Navigator.pushNamed(
                                        //     context, RouteScreen.forgot);
                                        goRouter.goNamed(RouteScreen.forgot);
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
                                onPress: () => signInProvider.signIn(context),
                                text: "Sign in",
                              ),
                              const SizedBox(
                                height: 40,
                              ),

                              // NOTE: UNCOMMENT IF YOU NEED THIS FEATURE
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(
                              //       "Don’t have an account?",
                              //       style: black500.copyWith(fontSize: 13.0),
                              //     ),
                              //     TextButton(
                              //       onPressed: () {
                              //         // Navigator.pushNamed(
                              //         //     context, RouteScreen.codeReveral);
                              //         goRouter.goNamed(RouteScreen.codeReveral);
                              //       },
                              //       child: Text(
                              //         "Sign up",
                              //         style:
                              //             primary700.copyWith(fontSize: 13.0),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
      ),
    );
  }
}
