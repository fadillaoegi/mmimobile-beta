import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import '../controllers/system_support_controller.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/system_support/item_system_support_widget.dart';
import 'package:mmimobile/app/widget/system_support/carousel_system_support_widget.dart';

class SystemSupportView extends GetView<SystemSupportController> {
  const SystemSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SystemSupportController());
    // final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Support",
        backRoute: false,
      ),
      body: CanvaApps(
        widget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTittle(
                title: "Professional Development\nTraining Programs",
                size: 18.0,
              ),
              // Center(
              //   child: Text(
              //     "Professional Development\nTraining Programs",
              //     textAlign: TextAlign.center,
              //     style: black700.copyWith(fontSize: 20.0),
              //   ),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              CarouselSystemSupport(controller: controller),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Make Up Your Brand",
                style: black700.copyWith(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              CarouselSystemSupport(controller: controller),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "How to Build Your Personal Branding",
                style: black700.copyWith(
                  fontSize: 16.0,
                ),
              ),
              // // NOTE: Carousel Section
              // CarouselSystemSupport(controller: controller),
              // const SizedBox(height: 10.0),
              // // NOTE: Free Class Section
              // SectionTittle(
              //   title: "Free Class",
              //   onTap: () => Get.toNamed(Routes.systemSupportClass),
              // ),
              // const SizedBox(height: 10.0),
              // buildHorizontalList(controller.itemEmpty),

              // // NOTE: Premium Class Section
              // const SectionTittle(title: "Premium Class"),
              // const SizedBox(height: 10.0),
              // buildHorizontalList(controller.itemEmpty),

              // // NOTE: Forum Section
              // const SectionTittle(title: "Forum"),
              // const SizedBox(height: 10.0),
              // buildHorizontalList(controller.itemEmpty),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalList(List<String> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text("No items available"),
      );
    }
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return const ItemSystemSupport();
        },
      ),
    );
  }
}
