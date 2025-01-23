import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/modules_system_support/system_support/controllers/system_support_controller.dart';
import 'package:mmimobile/app/styles/color.dart';

class CarouselSystemSupport extends StatelessWidget {
  const CarouselSystemSupport({
    super.key,
    required this.controller,
  });

  final SystemSupportController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // NOTE: Validasi jika imageUrl kosong
        if (controller.imageUrl.isEmpty) {
          return const Center(
            child: Text(
              "No images available",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return Column(
          children: [
            Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(10.0),
              child: CarouselSlider.builder(
                itemCount: controller.imageUrl.length,
                itemBuilder: (context, index, _) {
                  final url = controller.imageUrl[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.20,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.decelerate,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) =>
                      controller.onPageChanged(index, reason),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.imageUrl.length,
                (index) => GestureDetector(
                  onTap: () => controller.currentIndex.value = index,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? ColorApps.primary
                          : ColorApps.disable,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
