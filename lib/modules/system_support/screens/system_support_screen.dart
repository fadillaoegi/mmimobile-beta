import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/modules/system_support/providers/system_support_provider.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/widget/section_title_widget.dart';
import 'package:provider/provider.dart';

class SystemSupportScreen extends StatefulWidget {
  const SystemSupportScreen({super.key});

  @override
  State<SystemSupportScreen> createState() => _SystemSupportScreenState();
}

class _SystemSupportScreenState extends State<SystemSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final systemSupportP = Provider.of<SystemSupportProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          padding: const EdgeInsets.all(14.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
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
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: systemSupportP.currentIndex == index
                                  ? Colors.blueAccent
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // NOTE: SECTION FREE CLASS
                const SectionTittle(
                  title: "Free Class",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // NOTE: SECTION PREMIUM CLASS
                const SectionTittle(
                  title: "Premium Class",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // NOTE: SECTION FORUM
                const SectionTittle(
                  title: "Forum",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
