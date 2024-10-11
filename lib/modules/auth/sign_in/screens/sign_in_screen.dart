import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
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
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        color: ColorApps.primary2,
        child: Stack(
          children: [
            Container(
              height: sizeScreen.height / 1.5,
              width: sizeScreen.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetConfig.bgLogin), fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                // NOTE: LOGO
                Image.asset(
                  AssetConfig.logo5,
                  height: 92.0,
                ),
                SizedBox(
                  height: sizeScreen.height / 6,
                ),

                // NOTE:
                Text(
                  "Let’s get you Login!",
                  style: white700.copyWith(fontSize: 30.0),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Hallo there, login to continue",
                    style: white500.copyWith(fontSize: 18.0),
                  ),
                ),

                // NOTE: CARD FORM
                Container(
                  padding: const EdgeInsets.all(30.0),
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: ColorApps.white,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BtnIcon(
                              onTap: () {},
                              text: "Telepon",
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: BtnIcon(
                              onTap: () {},
                              text: "Google",
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Atau masuk dengan",
                              style: primary400.copyWith(fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Email",
                        style: primary700.copyWith(fontSize: 14.0),
                      ),
                      FormApps(
                        controller: _emailController,
                        hint: "example@gmail.com",
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Password",
                        style: primary700.copyWith(fontSize: 14.0),
                      ),
                      FormApps(
                        controller: _passController,
                        hint: "*******",
                        activeSuffix: true,
                        obsecure: _isObsecure,
                        onTapSuffix: () {
                          setState(() {
                            _isObsecure = !_isObsecure;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Lupa Password",
                                style: primary600.copyWith(fontSize: 14.0),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BtnDefault(
                        onPress: () {},
                        text: "Masuk",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(children: [TextSpan()])),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BtnIcon extends StatelessWidget {
  const BtnIcon({
    super.key,
    this.onTap,
    this.text = "",
    this.imageIcon = "assets/images/googleIcon.png",
  });
  final VoidCallback? onTap;
  final String? text;
  final String? imageIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: ColorApps.white,
            border: Border.all(color: ColorApps.primary),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageIcon!,
              height: 20.0,
              width: 20.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              text!,
              style: black600.copyWith(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
