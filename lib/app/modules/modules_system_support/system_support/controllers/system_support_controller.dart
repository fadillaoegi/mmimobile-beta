import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/slider_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class SystemSupportController extends GetxController {
  // final itemEmpty = List<String>.filled(10, "").obs;
  final CarouselController buttonCarouselController = CarouselController();
  final userData = Get.put(UserController());
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final dataSLider = <SliderApps>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  // NOTE: Function to handle carousel page change
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
