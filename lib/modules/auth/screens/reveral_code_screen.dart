import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';
import 'package:mmimobile/widget/out_btn_apps_widget.dart';

class ReveralCodeScreen extends StatelessWidget {
  const ReveralCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeReveralC = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //         child: const Icon(
                  //           Icons.arrow_back,
                  //           color: ColorApps.primary,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Center(
                    child: Image.asset(
                      AssetConfig.logo3,
                      height: 50.0,
                    ),
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorApps.black
                                .withOpacity(0.10), // Warna bayangan
                            spreadRadius: 1, // Seberapa jauh shadow menyebar
                            blurRadius: 10, // Seberapa halus blur shadow
                            offset: const Offset(0, 7), // Offset shadow (X, Y)
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Please enter your referral code",
                          style: black400.copyWith(fontSize: 14.0),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        FormAppsTwo(
                          controller: codeReveralC,
                          labelText: "Code Reveral",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        BtnApps(
                          onPress: () {},
                          text: "Enter code",
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        OutBtnApps(
                          onPress: () {},
                          text: "Skip",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
