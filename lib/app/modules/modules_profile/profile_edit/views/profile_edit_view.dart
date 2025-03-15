import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mmimobile/app/utils/image_converter_fldev.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';

import '../controllers/profile_edit_controller.dart';

class ProfileEditView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileEditController());
    final imageController = Get.put(ImageConverterFldev());

    return Scaffold(
      appBar: AppBarAppFLdev(title: "Ubah Profil"),
      body: CanvaApps(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Obx(() {
                  Uint8List? imageBytes;

                  // Jika user mengunggah gambar, gunakan gambar dari Base64
                  if (imageController.dataImageBase64.value.isNotEmpty) {
                    try {
                      imageBytes =
                          base64Decode(imageController.dataImageBase64.value);
                    } catch (e) {
                      imageBytes = null; // Handle error decoding
                    }
                  } else if (controller.userData.user.customerPhotoProfil !=
                          null &&
                      controller
                          .userData.user.customerPhotoProfil!.isNotEmpty) {
                    try {
                      imageBytes = base64Decode(
                          controller.userData.user.customerPhotoProfil!);
                    } catch (e) {
                      imageBytes = null; // Handle error jika tidak valid Base64
                    }
                  }

                  return ImageCircle(
                    onTap: () =>
                        imageController.pickImageCropper(ImageSource.gallery),
                    size: 100.0,
                    image: imageBytes != null
                        ? MemoryImage(imageBytes!) as ImageProvider
                        : NetworkImage(controller
                                .userData.user.customerPhotoProfil ??
                            "https://raw.githubusercontent.com/fadillaoegi/APIMyAssets/refs/heads/master/logo/logo.png"),
                  );
                }),
              ),
              FormAppsFLdev(
                labelText: "Nama",
                controller: controller.nameController,
              ),
              const SizedBox(height: 20.0),
              FormAppsFLdev(
                labelText: "Email",
                controller: controller.emailController,
                readOnly: true,
              ),
              const SizedBox(height: 20.0),
              IntlPhoneField(
                controller: controller.phoneController,
                validator: (value) {
                  if (value == null || value.completeNumber.isEmpty) {
                    return "Nomor telepon harus diisi";
                  }
                  return null;
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  fillColor: ColorApps.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.disable, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.secondary, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'ID',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  controller.phoneController.text = phone.completeNumber;
                },
              ),
              SectionTittle(title: "Tanggal Lahir"),
              const SizedBox(height: 10.0),
              TextFormField(
                readOnly: true,
                controller: controller.bornController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorApps.white,
                  labelStyle: secondary500,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.disable, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorApps.secondary, width: 2.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => controller.pickDate(context),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              SectionTittle(title: "Alamat Penagihan"),
              FormAppsFLdev(
                  maxLines: 3, controller: controller.addressController),
              const SizedBox(height: 20.0),
              SectionTittle(title: "Alamat Kirim"),
              FormAppsFLdev(
                  maxLines: 3, controller: controller.addressSendController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: BtnApps(
                  onPress: () => controller
                      .updateProfile(imageController.dataImageBase64.value),
                  text: "Simpan",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
