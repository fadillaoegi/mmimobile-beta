import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileEditController extends GetxController {
  final userData = Get.find<UserController>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bornController = TextEditingController();
  final addressController = TextEditingController();
  final addressSendController = TextEditingController();

  final selectedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi data dari userData
    nameController.text = userData.user.customerName ?? "";
    emailController.text = userData.user.customerEmail ?? "";
    phoneController.text = userData.user.customerPhone ?? "";
    addressController.text = userData.user.customerAddress ?? "";
    addressSendController.text = userData.user.customerAddressRecipient ?? "";

    // Inisialisasi bornController dengan format yang benar
    if (userData.user.customerDateBirth != null &&
        userData.user.customerDateBirth!.isNotEmpty) {
      try {
        DateTime parsedDate =
            DateFormat("yyyy-MM-dd").parse(userData.user.customerDateBirth!);
        bornController.text = FormatAppsFLdev.dateFull(parsedDate.toString());
        selectedDate.value = bornController.text;
      } catch (e) {
        bornController.text = "";
        selectedDate.value = "";
      }
    }
  }

  void pickDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    if (bornController.text.isNotEmpty) {
      try {
        // initialDate = FormatAppsFLdev.dateFull(bornController.text);
        initialDate = DateFormat('dd-MM-yyyy').parse(bornController.text);
      } catch (e) {
        initialDate = DateTime.now();
      }
    }

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MMMM-yyyy').format(pickedDate);
      selectedDate.value = formattedDate;
      bornController.text = formattedDate;
    }
  }
}
