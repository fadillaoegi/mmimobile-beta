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
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      // appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          color: ColorApps.primary2,
          // color: ColorApps.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizeScreen.height / 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ColorApps.white,
                          size: 30.0,
                        ),
                      ),
                    ),

                    // NOTE: LOGO
                    // Image.asset(
                    //   AssetConfig.logo5,
                    //   height: 92.0,
                    // ),
                    SizedBox(
                      height: sizeScreen.height / 6,
                    ),
                    SizedBox(
                      width: sizeScreen.width,
                      child: Text(
                        "Lupa Password",
                        textAlign: TextAlign.center,
                        style: white600.copyWith(fontSize: 30.0),
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
                          Text(
                            "Silahkan masukan alamat email Anda, untuk mendapatkan kode verifikasi OTP ",
                            style: black400.copyWith(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          FormAppsTwo(
                            controller: _emailController,
                            labelText: "Email",
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          BtnDefault(
                            onPress: () {
                              focusNode.unfocus();
                            },
                            text: "Lupa Password",
                          ),
                          const SizedBox(
                            height: 20,
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
