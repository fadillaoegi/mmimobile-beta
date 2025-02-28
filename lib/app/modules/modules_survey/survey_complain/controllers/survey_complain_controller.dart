import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SurveyComplainController extends GetxController {
  final count = 0.obs;
  final file = Rx<File?>(null);
  final selectedImage = Rx<File?>(null);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage(File(image.path));
    }
  }

  Future<void> cropImage(File imageFile) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(),
        IOSUiSettings(),
      ],

      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9,
      // ],
      // androidUiSettings: const AndroidUiSettings(
      //   toolbarTitle: 'Crop Image',
      //   toolbarColor: Colors.green,
      //   toolbarWidgetColor: Colors.white,
      //   initAspectRatio: CropAspectRatioPreset.original,
      //   lockAspectRatio: false,
      // ),
    );
    if (croppedImage != null) {
      selectedImage.value = File(croppedImage.path);
    }
  }
}
