import 'dart:async';

import 'package:get/get.dart';
import 'package:mmimobile/app/routes/app_pages.dart';

class SplashController extends GetxController {
  Rx<String> message = "Loading...".obs;
  Rx<bool> isUser = false.obs;

  // NOTE: OVERRIDE
  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // NOTE: FUCNTION
  Future<void> startSplash() async {
    Timer(
      const Duration(seconds: 2),
      () {
        message.value;
        update();
        Timer(
          const Duration(seconds: 2),
          () {
            message.value = "Checking user session...";
            update();

            Timer(
              const Duration(seconds: 3),
              () {
                if (isUser.value) {
                  Get.offAllNamed(Routes.appMain);
                } else {
                  Get.offAllNamed(Routes.signIn);
                }
              },
            );
          },
        );
      },
    );
  }
}
