// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/data/sources/source_apps.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_no_action_widget.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
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
  final Rx<String?> selectedImagePath = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();

    nameController.text = userData.user.customerName ?? "";
    emailController.text = userData.user.customerEmail ?? "";
    phoneController.text = userData.user.customerPhone ?? "";
    addressController.text = userData.user.customerAddress ?? "";
    addressSendController.text = userData.user.customerAddressRecipient ?? "";

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
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      await cropImage(image.path);
    }
  }

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
    }
  }

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

  Future<void> updateProfile() async {
    isLoading(true);
    try {
      FormData formData = FormData.fromMap({
        'customer_id': userData.user.customerId.toString().trim(),
        'customer_name': nameController.text.toString().trim(),
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
            filename: selectedImagePath.value!.split('/').last,
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

      SnackbarFLdev.snackShow(title: "Berhasil", message: "Profil diperbarui");
    } catch (e) {
      print("Error updating profile: $e");
    } finally {
      isLoading(false);
    }
  }
}
