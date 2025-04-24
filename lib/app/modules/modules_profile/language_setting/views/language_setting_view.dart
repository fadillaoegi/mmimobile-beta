import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/transparant_card_widget.dart';
import '../controllers/language_setting_controller.dart';

class LanguageSettingView extends GetView<LanguageSettingController> {
  const LanguageSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LanguageSettingController());

    return Scaffold(
      appBar: const AppBarAppFLdev(title: "Pengaturan Bahasa"),
      body: CanvaFLdev(
        widget: Obx(() => Column(
              children: [
                CardFLdev(
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      languageCheck(
                        "Indonesia",
                        checked: controller.language.value == "id",
                        onTap: () => controller.languageChanged("id"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(color: ColorApps.card3),
                      ),
                      languageCheck(
                        "Inggris",
                        checked: controller.language.value == "en",
                        onTap: () => controller.languageChanged("en"),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget languageCheck(String language,
      {required bool checked, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          checked
              ? const Icon(Icons.check, color: ColorApps.secondary)
              : const SizedBox(width: 24.0), // Placeholder agar tetap sejajar
          const SizedBox(width: 10.0),
          Text(language, style: black400),
        ],
      ),
    );
  }
}
