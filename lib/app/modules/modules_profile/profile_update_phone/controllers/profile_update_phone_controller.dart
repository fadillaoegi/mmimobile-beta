import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileUpdatePhoneController extends GetxController {
  late final UserController dataUser;
  late final passwordController = TextEditingController().obs;
  late final phoneController = TextEditingController().obs;
  final obsecure = true.obs;
  @override
  void onInit() {
    super.onInit();
    dataUser = Get.find<UserController>();
    phoneController.value =
        TextEditingController(text: dataUser.user.customerPhone);
  }

  @override
  void onClose() {
    super.onClose();
  }

  seeHide() {
    obsecure.value = !obsecure.value;
    update();
  }

  updatePhone() async {
    try {} catch (e) {
      DMethod.printTitle('Try ~ from Controller', e.toString());
    }
  }
}
