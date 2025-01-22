import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileEditPasswordController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final isObsecure = true.obs;
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  hidePass() {
    isObsecure.value = !isObsecure.value;
    update();
  }
}
