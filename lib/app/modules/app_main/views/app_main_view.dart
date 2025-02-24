import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/styles/color.dart';

import '../controllers/app_main_controller.dart';

class AppMainView extends GetView<AppMainController> {
  const AppMainView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppMainController());
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: Material(
          elevation: 10.0,
          child: BottomNavigationBar(
            selectedItemColor: ColorApps.secondary,
            selectedFontSize: 13.0,
            iconSize: 24.0,
            elevation: 20.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorApps.cardTransparan,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            items: controller.items,
          ),
        ),
      ),
    );
  }
}
