import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/data/models/home/slider_model.dart';
import 'package:mmimobile/app/data/models/system_support/system_support_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';

class SystemSupportController extends GetxController {
  // final itemEmpty = List<String>.filled(10, "").obs;
  final CarouselController buttonCarouselController = CarouselController();
  final userData = Get.put(UserController());
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final dataSLider = <SliderApps>[].obs;
  final listDataSystemSuport = <SystemSupport>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSystemSupport();
  }

  // NOTE: fetch data system support
  fetchSystemSupport() async {
    isLoading(true);
    final formData = FormData.fromMap({
      'membership_id': userData.user.membershipId.toString(),
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.listSupportSystem, formData);

      final data = response!.data['data'] as List;
      listDataSystemSuport.value = data
          .map(
            (e) => SystemSupport.fromJson(e),
          )
          .toList();
      print(listDataSystemSuport);
      if (response.statusCode == 200) {
      } else if (response.statusCode == 500) {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data slider",
        );
      } else {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data slider",
        );
      }
    } catch (e) {
      print(e);
    } finally {
      update();
      isLoading(false);
    }
  }

  // NOTE: Function to handle carousel page change
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
