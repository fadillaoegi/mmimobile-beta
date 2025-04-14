import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:path/path.dart' as path;
import 'package:mmimobile/app/api/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
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
  final isLoading = false.obs;
  final Rxn<String> selectedImagePath = Rxn<String>();
  final Rxn<String> selectedImageBase64 =
      Rxn<String>(); // Untuk tampilan real-time

  @override
  void onInit() {
    super.onInit();
    nameController.text = userData.user.customerName ?? "";
    emailController.text = userData.user.customerEmail ?? "";
    phoneController.text = userData.user.customerPhone ?? "";
    addressController.text = userData.user.customerAddress ?? "";
    addressSendController.text = userData.user.customerAddressRecipient ?? "";

    // NOTE: Convert date birth
    if (userData.user.customerDateBirth != null &&
        userData.user.customerDateBirth!.isNotEmpty) {
      try {
        DateTime parsedDate =
            DateFormat("yyyy-MM-dd").parse(userData.user.customerDateBirth!);
        bornController.text = DateFormat("dd MMMM yyyy").format(parsedDate);
        selectedDate.value = DateFormat("yyyy-MM-dd").format(parsedDate);
      } catch (e) {
        bornController.text = "";
        selectedDate.value = "";
      }
    }

    // NOTE: when Jika ada foto profil, show in UI base64
    if (userData.user.customerPhotoProfil != null) {
      selectedImageBase64.value = userData.user.customerPhotoProfil;
    }
  }

  Future<void> refreshUserData() async {
    isLoading(true);
    try {
      final formData = FormData.fromMap({
        'customer_id': userData.user.customerId,
      });

      final result = await SourceApps.hitApiToMap(ApiApps.getUser, formData);
      User user = User.fromJson(result!['data']);
      SessionUserFLdev.saveUser(user);

      if (result.isNotEmpty && result['status'] == true) {
        User user = User.fromJson(result['data']);
        await SessionUserFLdev.saveUser(user);
        userData.user != user; // Update user controller

        // NOTE: Update TextEditingController
        nameController.text = user.customerName ?? "";
        emailController.text = user.customerEmail ?? "";
        phoneController.text = user.customerPhone ?? "";
        addressController.text = user.customerAddress ?? "";
        addressSendController.text = user.customerAddressRecipient ?? "";

        // Update tanggal lahir
        if (user.customerDateBirth != null &&
            user.customerDateBirth!.isNotEmpty) {
          try {
            DateTime parsedDate =
                DateFormat("yyyy-MM-dd").parse(user.customerDateBirth!);
            bornController.text = DateFormat("dd MMMM yyyy").format(parsedDate);
            selectedDate.value = DateFormat("yyyy-MM-dd").format(parsedDate);
          } catch (e) {
            bornController.text = "";
            selectedDate.value = "";
          }
        }

        // Update gambar profil (base64)
        selectedImageBase64.value = user.customerPhotoProfil;

        update();
      } else {
        Get.snackbar("Gagal", "Gagal menyegarkan data pengguna.");
      }
    } catch (e) {
      print("Error refresh user: $e");
      Get.snackbar("Error", "Terjadi kesalahan saat refresh data.");
    } finally {
      isLoading(false);
    }
  }

  // NOTE: Choose camera or gallery
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      await cropImage(image.path);
    }
  }

  // NOTE: Fungsi untuk memotong gambar sebelum diunggah
  Future<void> cropImage(String imagePath) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Sesuaikan foto',
          toolbarColor: ColorApps.secondary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Sesuaikan foto',
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      selectedImagePath.value = croppedFile.path;
      _convertImageToBase64(croppedFile.path);
      update();
    }
  }

  // NOTE: Konversi gambar ke base64 untuk tampilan real-time
  Future<void> _convertImageToBase64(String imagePath) async {
    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    selectedImageBase64.value = base64Image;
  }

  // NOTE: Fungsi untuk memilih tanggal lahir
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value.isNotEmpty
          ? DateFormat("yyyy-MM-dd").parse(selectedDate.value)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      bornController.text = DateFormat("dd MMMM yyyy").format(picked);
      selectedDate.value = DateFormat("yyyy-MM-dd").format(picked);
    }
  }

  // NOTE: Fungsi untuk mengupdate profil ke API
  Future<void> updateProfile() async {
    Get.dialog(AlertDialogApps(
      lotties: AssetConfigFLdev.lottieWarning,
      postive: true,
      title: 'Anda yakin ? ',
      content: 'Memperbarui profil',
      textBtn: 'Ya',
      onTap: () async {
        Get.back();
        isLoading(true);
        try {
          FormData formData = FormData.fromMap({
            'customer_id': userData.user.customerId.toString().trim(),
            'customer_name': nameController.value.text.toString().trim(),
            'customer_email': emailController.text.toString().trim(),
            'customer_phone': phoneController.text.toString().trim(),
            'customer_address': addressController.text.toString().trim(),
            'customer_address_recipient':
                addressSendController.text.toString().trim(),
            'customer_date_birth': selectedDate.value,
          });

          if (selectedImagePath.value != null) {
            formData.files.add(MapEntry(
              'customer_photo_profil',
              await MultipartFile.fromFile(
                selectedImagePath.value!,
                filename: path.basename(selectedImagePath.value!),
              ),
            ));
          }

          final result =
              await SourceApps.hitApiToMap(ApiApps.updateProfileFull, formData);

          if (result == null || !result['status']) {
            Get.dialog(
              AlertDialogNoAction(
                title: "Gagal",
                content: "Gagal memperbarui profil",
              ),
              barrierDismissible: false,
            );
            Future.delayed(const Duration(seconds: 3), Get.back);
            return;
          }

          User user = User.fromJson(result['data']);
          SessionUserFLdev.saveUser(user);

          Get.dialog(
            AlertDialogNoAction(
              lotties: AssetConfigFLdev.lottieSuccess,
              title: "Berhasil",
              content: "Berhasil memperbarui profil",
            ),
            barrierDismissible: false,
          );
          Future.delayed(const Duration(seconds: 3), Get.back);
          // SnackbarFLdev.snackShow(
          //     title: "Berhasil", message: "Profil diperbarui");
        } catch (e) {
          print("Error updating profile: $e");
        } finally {
          isLoading(false);
        }
      },
    ));
  }

  bool isBase64(String str) {
    final RegExp base64Pattern = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Pattern.hasMatch(str) && (str.length % 4 == 0);
  }
}
