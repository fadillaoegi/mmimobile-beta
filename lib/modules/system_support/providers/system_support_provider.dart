import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class SystemSupportProvider extends ChangeNotifier {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentIndex = 0;
  // int get currentIndex => _currentIndex;
  final List<String> itemEmpty = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  final List<String> imageUrls = [
    'https://mashmoshem.co.id/wp-content/uploads/2024/08/MMI-Banner-2.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2024/09/Clay-Mask.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2021/04/beda-oem-dan-odm.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2024/12/make-up-untuk-kulit-kering.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2022/12/cara-membuat-brand-skincare.webp',
  ];

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    // setState(() {
    currentIndex = index;
    // });
    notifyListeners();
  }
}
