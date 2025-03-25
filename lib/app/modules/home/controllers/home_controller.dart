import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/configs/asset_config.dart';

class HomeController extends GetxController {
  // Controller untuk Carousel
  final CarouselController carouselController = CarouselController();

  // Index saat ini dari carousel
  final currentIndex = 0.obs;

  // NOTE: Url image for high light
  final urlImageHighLight = <String>[
    AssetConfigFLdev.example1,
    AssetConfigFLdev.example2,
    AssetConfigFLdev.example3,
    AssetConfigFLdev.example1,
  ].obs;

  // Daftar URL gambar untuk carousel
  final urlImageCarousel = <String>[
    AssetConfigFLdev.banner1,
    AssetConfigFLdev.banner2,
    AssetConfigFLdev.banner3,
    // 'https://mashmoshem.co.id/wp-content/uploads/2024/09/Clay-Mask.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2021/04/beda-oem-dan-odm.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2024/12/make-up-untuk-kulit-kering.webp',
    // 'https://mashmoshem.co.id/wp-content/uploads/2022/12/cara-membuat-brand-skincare.webp',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    print("WOKWOKWOK");
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Fungsi untuk mengubah halaman carousel
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
