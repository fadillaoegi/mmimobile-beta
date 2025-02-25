import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: ColorApps.bottom,
                boxShadow: boxShadow),
            child: BottomNavigationBar(
              selectedItemColor: ColorApps.white,
              enableFeedback: false,
              useLegacyColorScheme: false,
              selectedFontSize: 13.0,
              iconSize: 24.0,
              elevation: 20.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color.fromARGB(0, 208, 242, 172),
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              items: controller.items,
            ),
          ),
        ),
      ),
    );
  }
}
