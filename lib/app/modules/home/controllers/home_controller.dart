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
  ].obs;

  @override
  void onInit() {
    super.onInit();
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
