import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form_apps_two_widget.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignInController>();
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      AssetConfigFLdev.bgLogin3,
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
                                        padding:
                                            const EdgeInsets.only(top: 30.0),
                                        child: Image.asset(
                                          AssetConfigFLdev.logo5,
                                          height: 50.0,
                                        ),
                                      ),
                                    ),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "Sign in to your account\n",
                                        style:
                                            white600.copyWith(fontSize: 26.0),
                                      ),
                                      TextSpan(
                                        text: "Welcome to MMI Mobile",
                                        style:
                                            white300.copyWith(fontSize: 22.0),
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
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                IntlPhoneField(
                                  controller: controller.phoneController.value,
                                  validator: (p0) {
                                    if (p0!.toString().isEmpty || p0 == "") {
                                      return "Phone is required ";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'ID',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                                // FormAppsTwo(
                                //   controller: controller.phoneController.value,
                                //   labelText: "Phone",
                                //   keybooardType: TextInputType.phone,
                                //   validator: (p0) {
                                //     if (p0!.isEmpty || p0 == "") {
                                //       return "Phone is required ";
                                //     }
                                //     return null;
                                //   },
                                // ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Obx(
                                  () => FormAppsTwo(
                                    controller: controller.passController.value,
                                    labelText: "Password",
                                    obscure: controller.isObsecure.value,
                                    suffixIcon: true,
                                    validator: (p0) {
                                      if (p0!.isEmpty || p0 == "") {
                                        return "Password is required ";
                                      } else if (p0.length < 8) {
                                        return "Password must be 8 characters ";
                                      }
                                      return null;
                                    },
                                    onTap: () => controller.hideSeePass(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.forgotPassword);
                                        },
                                        child: Text(
                                          "Forgot Password",
                                          style: primary600.copyWith(
                                              fontSize: 13.0),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                BtnApps(
                                  onPress: () => controller.signIn(context),
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
      ),
    );
  }
}
