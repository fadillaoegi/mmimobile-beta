import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/alert/alert_form_pass_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';

import '../controllers/profile_update_address_controller.dart';

class ProfileUpdateAddressView extends GetView<ProfileUpdateAddressController> {
  const ProfileUpdateAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    final dataUser = Get.put(UserController());
    final controller = Get.put(ProfileUpdateAddressController());
    String customerId = dataUser.user.customerId.toString();
    return Scaffold(
      appBar: AppBarAppFLdev(
        checkClick: true,
        title: 'Update address',
        onTap: () {
          Get.dialog(
              Obx(() => AlertFormPass(
                    obscureText: controller.obsecureText.value,
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
                      controller.updateAdress(context, customerId);
                    },
                  )),
              barrierDismissible: false);
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorApps.white,
                          boxShadow: boxShadow),
                      child: TextFormField(
                        controller: controller.addressController.value,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
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
