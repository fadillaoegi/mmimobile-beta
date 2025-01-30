import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarFLdev {
  static void snackShow({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
