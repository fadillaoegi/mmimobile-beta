import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/system_support_controller.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/system_support/item_system_support_widget.dart';

class SystemSupportView extends GetView<SystemSupportController> {
  const SystemSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SystemSupportController());
    final sizeScreen = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: CanvaApps(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTittle(
                title: "Professional Development\nTraining Programs",
                size: 18.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: sizeScreen.width,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: ColorApps.white,
                    boxShadow: boxShadow,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(147, 158, 181, 87),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Row(
                        children: [
                          Text(
                            "Lainya",
                            style: white700.copyWith(fontSize: 13.0),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: ColorApps.white,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ],
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
