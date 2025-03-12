import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/alert/alert_form_pass_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/profile_update_email_controller.dart';

class ProfileUpdateEmailView extends GetView<ProfileUpdateEmailController> {
  const ProfileUpdateEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileUpdateEmailController());
    final userController = Get.put(UserController());
    String customerId = userController.user.customerId.toString();
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: LoadingApps(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: controller.formKey,
            child: Scaffold(
              appBar: AppBarAppFLdev(
                title: "Update Email",
                checkClick: true,
                onTap: () {
                  Get.dialog(
                      Obx(() => AlertFormPass(
                            obscureText: controller.obsecure.value,
                            controller: controller.passwordController.value,
                            validator: (p0) {
                              if (p0!.isEmpty || p0 == "") {
                                return "Password is required ";
                              }
                              return null;
                            },
                            btnTitle: 'Update email',
                            onTapSuffix: () => controller.seeHide(),
                            onTap: () {
                              Get.back();
                              controller.updateEmail(context, customerId);
                            },
                          )),
                      barrierDismissible: false);
                },
              ),
              body: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
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
                              child: Column(
                                children: [
                                  Obx(
                                    () => FormAppsFLdev(
                                      controller:
                                          controller.emailController.value,
                                      labelText: userController
                                          .user.customerEmail
                                          .toString(),
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "you haven't made any changes";
                                        } else if (p0.length <= 5) {
                                          return "Name must contain at least 5 characters";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              )),
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
