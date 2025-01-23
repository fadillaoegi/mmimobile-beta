import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import '../controllers/system_support_controller.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/system_support/carousel_widget.dart';
import 'package:mmimobile/app/widget/system_support/item_system_support_widget.dart';

class SystemSupportView extends GetView<SystemSupportController> {
  const SystemSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final controller = Get.put(SystemSupportController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: Carousel Section
                CarouselSystemSupport(controller: controller),
                const SizedBox(height: 10.0),

                // NOTE: Free Class Section
                SectionTittle(
                  title: "Free Class",
                  onTap: () => Get.toNamed(Routes.systemSupportClass),
                ),
                const SizedBox(height: 10.0),
                buildHorizontalList(controller.itemEmpty),

                // NOTE: Premium Class Section
                const SectionTittle(title: "Premium Class"),
                const SizedBox(height: 10.0),
                buildHorizontalList(controller.itemEmpty),

                // NOTE: Forum Section
                const SectionTittle(title: "Forum"),
                const SizedBox(height: 10.0),
                buildHorizontalList(controller.itemEmpty),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHorizontalList(List<String> items) {
    if (items.isEmpty) {
      return const Center(child: Text("No items available"));
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
