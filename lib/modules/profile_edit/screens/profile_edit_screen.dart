import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/widget/form_apps_two_widget.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("Edit profile", style: primary700.copyWith(fontSize: 20.0)),
          scrolledUnderElevation: 0.0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorApps.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorApps.black
                                  .withOpacity(0.10), // Warna bayangan
                              spreadRadius: 1, // Seberapa jauh shadow menyebar
                              blurRadius: 10, // Seberapa halus blur shadow
                              offset:
                                  const Offset(0, 7), // Offset shadow (X, Y)
                            ),
                          ]),
                      child: Form(
                        child: Column(
                          children: [
                            FormAppsTwo(
                              labelText: "Email",
                              controller: TextEditingController(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            FormAppsTwo(
                              labelText: "Name",
                              controller: TextEditingController(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            FormAppsTwo(
                              labelText: "Phone",
                              controller: TextEditingController(),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            BtnApps(
                              onPress: () {},
                              text: "Update",
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
        ));
  }
}
