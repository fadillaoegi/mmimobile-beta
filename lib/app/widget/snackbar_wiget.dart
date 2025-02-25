import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/styles/color.dart';

class SnackbarFLdev {
  static void snackShow({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorApps.card2,
      colorText: const Color.fromARGB(185, 24, 23, 23),
      duration: const Duration(seconds: 3),
    );
  }
}
