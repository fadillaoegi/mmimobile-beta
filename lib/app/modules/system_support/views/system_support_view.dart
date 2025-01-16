import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/system_support/carousel_widget.dart';
import 'package:mmimobile/app/widget/system_support/item_system_support_widget.dart';
import '../controllers/system_support_controller.dart';

class SystemSupportView extends GetView<SystemSupportController> {
  const SystemSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
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
                // NOTE: CAROUSEL
                CarouselSystemSupport(controller: controller),
                const SizedBox(
                  height: 10.0,
                ),

                // NOTE: SECTION FREE CLASS
                SectionTittle(
                  title: "Free Class",
                  onTap: () => Get.toNamed(Routes.systemSupportClass),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.itemEmpty.length,
                        (index) => const ItemSystemSupport(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // NOTE: SECTION PREMIUM CLASS
                const SectionTittle(
                  title: "Premium Class",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.itemEmpty.length,
                        (index) => const ItemSystemSupport(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // NOTE: SECTION FORUM
                const SectionTittle(
                  title: "Forum",
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                    height: 200.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.itemEmpty.length,
                          (index) => const ItemSystemSupport(),
                        ),
                      ),
                    )),

                // _buildHorizontalList(controller.itemEmpty)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildHorizontalList(List<String> items) {
  //   return SizedBox(
  //     height: 200.0,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         return const ItemSystemSupport();
  //       },
  //     ),
  //   );
  // }
}
