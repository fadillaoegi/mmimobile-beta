// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/home/controllers/home_controller.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({
    Key? key,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  final HomeController controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Validasi jika imageUrl kosong
        if (controller.urlImageCarousel.isEmpty) {
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
            Center(
              child: Container(
                // elevation: 4.0,
                width: 380.0,
                decoration: BoxDecoration(
                  color: ColorApps.white,
                  boxShadow: boxShadow,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CarouselSlider.builder(
                  itemCount: controller.urlImageCarousel.length,
                  itemBuilder: (context, index, _) {
                    final url = controller.urlImageCarousel[index];
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.supportDetail),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.asset(
                              url,
                              fit: BoxFit.cover,
                            )

                            // CachedNetworkImage(
                            //   imageUrl: url,
                            //   // fit: BoxFit.cover,
                            //   placeholder: (context, url) => const Center(
                            //     child: CupertinoActivityIndicator(),
                            //   ),
                            //   errorWidget: (context, url, error) => const Center(
                            //     child: Icon(
                            //       Icons.broken_image,
                            //       color: Colors.grey,
                            //     ),
                            //   ),
                            // ),
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn, // Animasi halus
                    enlargeCenterPage: false, // Tidak memperbesar slide tengah
                    onPageChanged: (index, reason) =>
                        controller.onPageChanged(index, reason),
                  ),
                ),
              ),
            ),

            // NOTE:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  // onTap: onTap,
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
