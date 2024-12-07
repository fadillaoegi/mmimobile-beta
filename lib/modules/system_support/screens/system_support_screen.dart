import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SystemSupportScreen extends StatefulWidget {
  const SystemSupportScreen({super.key});

  @override
  State<SystemSupportScreen> createState() => _SystemSupportScreenState();
}

class _SystemSupportScreenState extends State<SystemSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    CarouselSliderController buttonCarouselController =
        CarouselSliderController();
    final List<String> imageUrls = [
      'https://via.placeholder.com/800x400?text=Slide+1',
      'https://via.placeholder.com/800x400?text=Slide+2',
      'https://via.placeholder.com/800x400?text=Slide+3',
      'https://via.placeholder.com/800x400?text=Slide+4',
      'https://via.placeholder.com/800x400?text=Slide+5',
    ];

    int _currentIndex = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sizeScreen.height,
          width: sizeScreen.width,
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CarouselSlider(
                    items: imageUrls.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageUrls.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          _currentIndex = entry.key;
                        }),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == entry.key
                                ? Colors.blueAccent
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
