import 'package:carousel_slider/carousel_options.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/data/models/highlight_model.dart';
import 'package:mmimobile/app/helpers/refresh_data_fldev.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HomeController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final userData = Get.put(UserController());
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final dataHighLightODM = <HighLight>[].obs;
  final dataHighLightOEM = <HighLight>[].obs;

  // Daftar URL gambar untuk carousel
  final urlImageCarousel = <String>[
    AssetConfigFLdev.banner1,
    AssetConfigFLdev.banner2,
    AssetConfigFLdev.banner3,
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getDataHighLightODM();
    print(userData.user.membershipId.toString());
  }

  // NOTE:  Carousel Change pages function
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  // NOTE: refresh data
  refreshData() async {
    isLoading(true);
    try {
      getDataHighLightODM();
      RefreshDataFldev.refreshDataUser(
          FormData.fromMap({'customer_id': userData.user.customerId}));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // NOTE: get data HighLight ODM
  getDataHighLightODM() async {
    isLoading(true);
    final formData = FormData.fromMap({
      'membership_id': userData.user.membershipId.toString(),
      'category_id': '1',
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getHighlightData, formData);

      final data = response!.data["data"] as List;
      dataHighLightODM.value = data
          .map(
            (e) => HighLight.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // NOTE: get data HighLight OEM
  getDataHighLightOEM() async {
    final formData = FormData.fromMap({
      'membership_id': userData.user.membershipId.toString(),
      'category_id': '2',
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getHighlightData, formData);
      final data = response!.data['data'] as List;
      dataHighLightODM.value = data
          .map(
            (e) => HighLight.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
