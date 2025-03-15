import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class ProfileEditController extends GetxController {
  final userData = Get.find<UserController>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bornController = TextEditingController();
  final addressController = TextEditingController();
  final addressSendController = TextEditingController();

  final selectedDate = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi data dari userData
    nameController.text = userData.user.customerName ?? "";
    emailController.text = userData.user.customerEmail ?? "";
    phoneController.text = userData.user.customerPhone ?? "";
    addressController.text = userData.user.customerAddress ?? "";
    addressSendController.text = userData.user.customerAddressRecipient ?? "";

    // Format tanggal lahir jika ada
    if (userData.user.customerDateBirth != null &&
        userData.user.customerDateBirth!.isNotEmpty) {
      try {
        DateTime parsedDate =
            DateFormat("yyyy-MM-dd").parse(userData.user.customerDateBirth!);
        bornController.text = DateFormat("dd MMMM yyyy").format(parsedDate);
        selectedDate.value = bornController.text;
      } catch (e) {
        bornController.text = "";
        selectedDate.value = "";
      }
    }
  }

  /// **Pilih tanggal lahir**
  void pickDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    if (bornController.text.isNotEmpty) {
      try {
        initialDate = DateFormat('dd MMMM yyyy').parse(bornController.text);
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
      String formattedDate = DateFormat('dd MMMM yyyy').format(pickedDate);
      selectedDate.value = formattedDate;
      bornController.text = formattedDate;
    }
  }

  /// **Update profil pengguna**
  Future<void> updateProfile(String customerPhotoProfil) async {
    isLoading(true);

    final formData = FormData.fromMap({
      'customer_id': userData.user.customerId.toString().trim(),
      'customer_name': nameController.text.toString().trim(),
      'customer_email': emailController.text.toString().trim(),
      'customer_phone': phoneController.text.toString().trim(),
      'customer_date_birth': DateFormat("yyyy-MM-dd")
          .format(DateFormat("dd MMMM yyyy").parse(selectedDate.value)),
      'customer_address': addressController.text.toString().trim(),
      'customer_address_recipient':
          addressSendController.text.toString().trim(),
      'customer_photo_profil': customerPhotoProfil.toString().trim(),
    });

    try {
      final result =
          await SourceApps.hitApiToMap(ApiApps.updateProfileFull, formData);

      if (result == null || !result['status']) {
        Get.dialog(
          AlertDialogNoAction(
            title: "Gagal",
            lotties: AssetConfigFLdev.lottieFailed,
            content: "Gagal diperbarui",
          ),
          barrierDismissible: false,
        );
        Future.delayed(const Duration(seconds: 3), Get.back);
        return;
      }

      // Perbarui sesi pengguna
      User user = User.fromJson(result['data']);
      SessionUserFLdev.saveUser(user);

      SnackbarFLdev.snackShow(title: "Berhasil", message: "Profil diperbarui");
    } catch (e) {
      print("Error updating profile: $e");
    } finally {
      isLoading(false);
    }
  }
}
