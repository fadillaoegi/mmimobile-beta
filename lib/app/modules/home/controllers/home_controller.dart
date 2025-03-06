import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  // Controller untuk Carousel
  final CarouselController carouselController = CarouselController();

  // Index saat ini dari carousel
  final currentIndex = 0.obs;

  // Daftar URL gambar untuk carousel
  final imageUrl = [
    'https://mashmoshem.co.id/wp-content/uploads/2024/08/MMI-Banner-2.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2024/09/Clay-Mask.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2021/04/beda-oem-dan-odm.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2024/12/make-up-untuk-kulit-kering.webp',
    'https://mashmoshem.co.id/wp-content/uploads/2022/12/cara-membuat-brand-skincare.webp',
  ].obs;

  // Fungsi untuk mengubah halaman carousel
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  // Fungsi untuk berpindah ke slide sebelumnya
  // void previousSlide() {
  //   carouselController.previousPage();
  // }

  // // Fungsi untuk berpindah ke slide berikutnya
  // void nextSlide() {
  //   carouselController.nextPage();
  // }
}
