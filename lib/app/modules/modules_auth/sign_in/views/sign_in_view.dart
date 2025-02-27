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
                    child: CanvaApps(
                      bg: AssetConfigFLdev.bgLoginNew,
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight / 2.8,
                          ),
                          Text.rich(
                            textAlign: TextAlign.start,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Selamat datang di MMI Apps\n",
                                  // text: "Masuk\n",
                                  style: secondary700.copyWith(fontSize: 20.0),
                                ),
                                TextSpan(
                                  text: "Masuk untuk melanjutkan",
                                  style: secondary400.copyWith(fontSize: 16.0),
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
                                  controller: controller.phoneController.value,
                                  validator: (p0) {
                                    if (p0!.toString().isEmpty || p0 == "") {
                                      return "Phone is required ";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ColorApps.primary)),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'ID',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                                const SizedBox(
                                  height: 10.0,
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
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.forgotPassword);
                                        },
                                        child: Text(
                                          "Lupa Password",
                                          style: secondary600.copyWith(
                                              fontSize: 13.0),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                BtnApps(
                                  onPress: () => controller.signIn(context),
                                  text: "Masuk",
                                ),
                                SizedBox(
                                  height: 60,
                                ),

                                // NOTE: UNCOMMENT IF YOU NEED THIS FEATURE
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "www.mashmoshem.co.id",
                                        style:
                                            disable500.copyWith(fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
      ),
    );
  }
}
