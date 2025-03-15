// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageConverterFldev extends GetxController {
  var dataImageName = "".obs;
  var dataImageByte = Rx<Uint8List?>(null);
  var dataImageBase64 = "".obs;
  var imageFile = Rx<File?>(null);

  /// **Ambil gambar dari galeri atau kamera**
  Future<void> pickImage(ImageSource imageSource) async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: imageSource,
        maxHeight: 1080,
        maxWidth: 1350,
        imageQuality: 30,
      );

      if (image != null) {
        Uint8List byte = await image.readAsBytes();
        String base64String = base64Encode(byte);

        dataImageName.value = image.name;
        dataImageByte.value = byte;
        dataImageBase64.value = base64String;
        imageFile.value = File(image.path);

        print("Base64: ${dataImageBase64.value}");
        update();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  /// **Hapus gambar yang dipilih**
  void clearImagePicker() {
    dataImageName.value = "";
    dataImageByte.value = null;
    dataImageBase64.value = "";
    imageFile.value = null;
    update();
  }

  /// **Pilih dan crop gambar**
  Future<void> pickImageCropper(ImageSource source) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;

      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        maxHeight: 1024,
        maxWidth: 1024,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
          ),
        ],
      );

      if (croppedFile != null) {
        File croppedImageFile = File(croppedFile.path);
        Uint8List croppedBytes = await croppedImageFile.readAsBytes();
        String croppedBase64 = base64Encode(croppedBytes);

        dataImageName.value = "cropped_${pickedImage.name}";
        dataImageByte.value = croppedBytes;
        dataImageBase64.value = croppedBase64;
        imageFile.value = croppedImageFile;

        print("Cropped Base64: ${dataImageBase64.value}");
        update();
      }
    } catch (e) {
      print("Error cropping image: $e");
    }
  }
}
