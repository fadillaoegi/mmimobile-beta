import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/controllers/system_support_controller.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class CarouselSystemSupport extends StatelessWidget {
  const CarouselSystemSupport({
    Key? key,
    required this.controller,
    // this.onTap,
  }) : super(key: key);

  final SystemSupportController controller;
  // final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Validasi jika imageUrl kosong
        if (controller.dataSLider.isEmpty) {
          return const Center(
            child: Text(
              "No images available",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return Stack(
          children: [
            // NOTE: Carousel Slider
            Container(
              decoration: BoxDecoration(
                color: ColorApps.white,
                boxShadow: boxShadow,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: CarouselSlider.builder(
                itemCount: controller.dataSLider.length,
                itemBuilder: (context, index, _) {
                  final url = controller.dataSLider[index].masterSliderImg;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(Routes.listSupport),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child:

                            // Image.asset(
                            //   url,
                            //   fit: BoxFit.cover,
                            // )

                            CachedNetworkImage(
                          imageUrl: "${ApiApps.assetPatch}/$url",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: LoadingApps(),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  // height: MediaQuery.of(context).size.height * 0.26,
                  height: 180.0,
                  viewportFraction: 1.0, // Mengisi seluruh viewport
                  autoPlay: true, // Mengaktifkan auto play
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn, // Animasi halus
                  enlargeCenterPage: false, // Tidak memperbesar slide tengah
                  onPageChanged: (index, reason) =>
                      controller.onPageChanged(index, reason),
                ),
              ),
            ),

            // NOTE: BTN button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  // onTap: () => Get.toNamed(Routes.underDevelopment),
                  onTap: () => Get.toNamed(Routes.listSupport),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(147, 158, 181, 87),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Row(
                      children: [
                        Text(
                          "More",
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
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Indicator
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     controller.imageUrl.length,
            //     (index) => GestureDetector(
            //       child: Obx(
            //         () => AnimatedContainer(
            //           duration: const Duration(milliseconds: 300),
            //           width: 12.0,
            //           height: 12.0,
            //           margin: const EdgeInsets.symmetric(
            //             vertical: 8.0,
            //             horizontal: 4.0,
            //           ),
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: controller.currentIndex.value == index
            //                 ? Color.fromARGB(255, 45, 127, 97)
            //                 : ColorApps.disable,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
