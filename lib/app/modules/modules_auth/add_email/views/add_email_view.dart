import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';

import '../controllers/add_email_controller.dart';

class AddEmailView extends GetView<AddEmailController> {
  const AddEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final customerId = Get.arguments as String;
    final controller = Get.put(AddEmailController());
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: ColorApps.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        AssetConfigFLdev.logo3,
                        height: 50.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Your account doesn't have an email, \nplease enter your email",
                      textAlign: TextAlign.center,
                      style: primary600.copyWith(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Lottie.asset(AssetConfigFLdev.lottieEmail),
                    const SizedBox(
                      height: 18.0,
                    ),
                    FormAppsFLdev(
                      controller: controller.emailController.value,
                      labelText: "Email",
                      validator: (p0) {
                        if (p0!.isEmpty || p0 == "") {
                          return "Email is required ";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BtnApps(
                      // onPress: () {},
                      onPress: () => controller.addEmail(context, customerId),
                      text: "Submit",
                    ),
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
