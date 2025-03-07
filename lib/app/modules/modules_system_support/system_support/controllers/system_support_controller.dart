import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/configs/asset_config.dart';

class SystemSupportController extends GetxController {
  // Carousel Controller
  final CarouselController buttonCarouselController = CarouselController();

  // Reactive Variables
  final currentIndex = 0.obs;
  final itemEmpty = List<String>.filled(10, "").obs;

  final imageUrl = [
    AssetConfigFLdev.banner1,
    AssetConfigFLdev.banner2,
    AssetConfigFLdev.banner3,
    // 'https://mashmoshem.co.id/wp-content/uploads/2024/08/MMI-Banner-2.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2024/09/Clay-Mask.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2021/04/beda-oem-dan-odm.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2024/12/make-up-untuk-kulit-kering.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2022/12/cara-membuat-brand-skincare.webp',
  ].obs;

  // Function to handle carousel page change
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
