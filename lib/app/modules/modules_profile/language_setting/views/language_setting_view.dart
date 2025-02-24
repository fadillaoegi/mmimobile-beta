import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_setting_controller.dart';

class LanguageSettingView extends GetView<LanguageSettingController> {
  const LanguageSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguageSettingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LanguageSettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
