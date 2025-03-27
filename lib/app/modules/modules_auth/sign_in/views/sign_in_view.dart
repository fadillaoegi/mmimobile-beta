import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    final sizeScreen = MediaQuery.sizeOf(context);

    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: CanvaApps(
                bg: AssetConfigFLdev.bgLoginNew,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height / 3.0),
                      // height: MediaQuery.sizeOf(context).height / 2.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Selamat datang di MMI Apps\n",
                                      // text: "Masuk\n",
                                      style:
                                          secondary700.copyWith(fontSize: 20.0),
                                    ),
                                    TextSpan(
                                      text: "Masuk untuk melanjutkan",
                                      style:
                                          secondary400.copyWith(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Form(
                                key: controller.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntlPhoneField(
                                      // controller:
                                      //     controller.phoneController.value,
                                      keyboardType: TextInputType.phone,
                                      validator: (p0) {
                                        if (p0!.toString().isEmpty ||
                                            p0 == "") {
                                          return "Nomor harus di isi";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Nomor HP',
                                        hintText: "81234xxxxx",
                                        fillColor: ColorApps.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorApps.disable,
                                                width: 2.0)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: ColorApps.secondary,
                                                width: 2.0)),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ColorApps.secondary,
                                              width: 2.0),
                                        ),
                                      ),
                                      initialCountryCode: 'ID',
                                      onChanged: (phone) {
                                        // print(phone.completeNumber);
                                        controller.phoneController.value.text =
                                            phone.completeNumber;
                                        print(controller
                                            .phoneController.value.text);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Obx(
                                      () => FormAppsFLdev(
                                        controller:
                                            controller.passController.value,
                                        labelText: "Password",
                                        obscure: controller.isObsecure.value,
                                        suffixIcon: true,
                                        validator: (p0) {
                                          if (p0!.isEmpty || p0 == "") {
                                            return "Password harus di isi ";
                                          } else if (p0.length < 8) {
                                            return "Password harus 8 Karakter ";
                                          }
                                          return null;
                                        },
                                        onTap: () => controller.hideSeePass(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Get.toNamed(
                                                  Routes.forgotPassword);
                                            },
                                            child: Text(
                                              "Lupa password",
                                              style: secondary600.copyWith(
                                                  fontSize: 13.0),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    BtnApps(
                                      onPress: () => controller.signIn(
                                          context,
                                          controller
                                              .phoneController.value.text),
                                      text: "Masuk",
                                    ),
                                    SizedBox(
                                      height: sizeScreen.height / 9.0,
                                      // height: 80.0,
                                    ),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "www.mashmoshem.co.id",
                                          style: disable500.copyWith(
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
      ),
    );
  }
}
