import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/alert/alert_form_pass_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../controllers/profile_update_phone_controller.dart';

class ProfileUpdatePhoneView extends GetView<ProfileUpdatePhoneController> {
  const ProfileUpdatePhoneView({super.key});
  @override
  Widget build(BuildContext context) {
    final userData = Get.put(UserController());

    String customerId = userData.user.customerId.toString().trim();
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBarAppFLdev(
              title: 'Update phone',
              checkClick: true,
              onTap: () {
                Get.dialog(
                  Obx(
                    () => AlertFormPass(
                      btnTitle: 'Update phone',
                      controller: controller.passwordController.value,
                      obscureText: controller.obsecure.value,
                      onTapSuffix: () => controller.seeHide(),
                      onTap: () {
                        Get.back();
                        controller.updatePhone(context, customerId);
                      },
                    ),
                  ),
                );
              },
            ),
            body: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14.0),
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ColorApps.white,
                                  boxShadow: boxShadow),
                              child: Obx(
                                () => IntlPhoneField(
                                  controller: controller.phoneController.value,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode: 'ID',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                    controller.phoneController.value.text =
                                        phone.completeNumber;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
