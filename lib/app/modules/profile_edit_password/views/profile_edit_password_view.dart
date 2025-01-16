import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';

import '../controllers/profile_edit_password_controller.dart';

class ProfileEditPasswordView extends GetView<ProfileEditPasswordController> {
  const ProfileEditPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("Edit Password", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(14.0),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorApps.white,
                        boxShadow: boxShadow),
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Please enter your new Password",
                            style: black400.copyWith(fontSize: 14.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Obx(
                            () => FormAppsTwo(
                              controller: controller.passController,
                              labelText: "Password",
                              obscure: controller.isObsecure.value,
                              suffixIcon: true,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Password is required";
                                }
                                return null;
                              },
                              onTap: () => controller.hidePass(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Obx(
                            () => FormAppsTwo(
                              controller: controller.confirmPassController,
                              labelText: "Confirm Password",
                              obscure: controller.isObsecure.value,
                              suffixIcon: true,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Confirm password required";
                                } else if (p0 !=
                                    TextEditingController().text) {}

                                return null;
                              },
                              onTap: () => controller.hidePass(),
                            ),
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
      ),
    );
  }
}
