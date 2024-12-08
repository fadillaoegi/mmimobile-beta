import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/modules/system_support/providers/system_support_provider.dart';
import 'package:mmimobile/styles/color.dart';

class CarouselSystemSupport extends StatelessWidget {
  const CarouselSystemSupport({
    super.key,
    required this.systemSupportP,
  });

  final SystemSupportProvider systemSupportP;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10.0),
          child: CarouselSlider.builder(
            itemCount: systemSupportP.imageUrls.length,
            itemBuilder: (context, index, _) {
              final url = systemSupportP.imageUrls[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  color: ColorApps.secondary,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
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
                  systemSupportP.onPageChanged(index, reason),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            systemSupportP.imageUrls.length,
            (index) => GestureDetector(
              onTap: () => systemSupportP.currentIndex = index,
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: systemSupportP.currentIndex == index
                      ? ColorApps.primary
                      : ColorApps.disable,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
