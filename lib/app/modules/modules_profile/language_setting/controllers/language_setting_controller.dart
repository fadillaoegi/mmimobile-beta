import 'package:get/get.dart';

class LanguageSettingController extends GetxController {
  final language = 'id'.obs; // Default Indonesia

  void languageChanged(String selectedLanguage) {
    language.value = selectedLanguage; // Update bahasa yang dipilih
  }
}
