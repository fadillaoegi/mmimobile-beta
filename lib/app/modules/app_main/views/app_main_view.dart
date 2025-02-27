import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import '../controllers/app_main_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
          elevation: 8.0,
          child: BottomNavigationBar(
            selectedItemColor: ColorApps.card3,
            enableFeedback: false,
            useLegacyColorScheme: false,
            selectedFontSize: 13.0,
            iconSize: 24.0,
            elevation: 20.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorApps.white,
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
