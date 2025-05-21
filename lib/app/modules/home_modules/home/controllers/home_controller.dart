import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/api/request_apps.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
import 'package:mmimobile/app/helpers/refresh_data_fldev.dart';
import 'package:mmimobile/app/data/models/home/slider_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mmimobile/app/data/models/home/highlight_oem_model.dart';
import 'package:mmimobile/app/data/models/home/highlight_odm_model.dart';
import 'package:mmimobile/app/data/models/home/article_from_web_model.dart';
import 'package:mmimobile/app/data/models/membership/membership_data_model.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HomeController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final userData = Get.put(UserController());
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final dataHighLightODM = <HighLightOdm>[].obs;
  final dataHighLightOEM = <HighLightOem>[].obs;
  final membershipData = MembershipData().obs;
  final dataSLider = <SliderApps>[].obs;
  final dataArticle = <ArticleWeb>[].obs;
  final visibleArticleCount = 4.obs;
  bool get isShowingAllArticles =>
      visibleArticleCount.value >= dataArticle.length;

  // Daftar URL gambar untuk carousel
  // final urlImageCarousel = <String>[
  //   AssetConfigFLdev.banner1,
  //   AssetConfigFLdev.banner2,
  //   AssetConfigFLdev.banner3,
  // ].obs;

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  // NOTE: refresh data
  refreshData() async {
    isLoading(true);
    try {
      getDataHighLightODM();
      getDataHighLightOEM();
      fetchMembershipDataId();
      getDataSLider();
      fetchArticle();
      showLessArticles();
      RefreshDataFldev.refreshDataUser(
          FormData.fromMap({'customer_id': userData.user.customerId}));
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // NOTE:  Carousel Change pages function
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  // NOTE: Function to handle get data from API
  getDataSLider() async {
    // isLoading(true);
    final formData = FormData.fromMap({
      "membership_id": userData.user.membershipId,
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getDataSlider, formData);
      print(response);
      final data = response!.data['data'] as List;
      dataSLider.value = data
          .map(
            (e) => SliderApps.fromJson(e),
          )
          .toList();
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
      // isLoading(false);
    }
  }

  // NOTE: get data HighLight ODM
  getDataHighLightODM() async {
    // isLoading(true);
    final formData = FormData.fromMap({
      'membership_id': userData.user.membershipId.toString(),
      'category_id': '2',
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getHighlightData, formData);

      final data = response!.data["data"] as List;
      dataHighLightODM.value = data
          .map(
            (e) => HighLightOdm.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    } finally {
      // isLoading(false);
    }
  }

  // NOTE: get data HighLight OEM
  getDataHighLightOEM() async {
    final formData = FormData.fromMap({
      'membership_id': userData.user.membershipId.toString(),
      'category_id': '1',
    });
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.getHighlightData, formData);
      final data = response!.data['data'] as List;
      dataHighLightOEM.value = data
          .map(
            (e) => HighLightOem.fromJson(e),
          )
          .toList();
    } catch (e) {
      print(e);
    }
  }

  // NOTE: fetch membership
  fetchMembershipDataId() async {
    // isLoading(true);
    final formData = FormData.fromMap(
        {'membership_id': userData.user.membershipId.toString()});
    try {
      final response =
          await RequestApp.postFutureDio(ApiApps.membershipDataId, formData);

      final rawData = response!.data['data'];
      membershipData.value = MembershipData.fromJson(rawData);

      if (response.statusCode == 200) {
      } else if (response.statusCode == 500) {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data membership",
        );
      } else {
        SnackbarFLdev.snackShow(
          title: "Terjadi kesalahan pada server",
          message: "Gagal mengambil data membership",
        );
      }
    } catch (e) {
      print(e);
    } finally {
      // isLoading(false);
    }
  }

  // NOTE: fetch article
  fetchArticle() async {
    try {
      final response = await RequestApp.getFutureDio(ApiApps.getDataArticle);
      final List<ArticleWeb> articles =
          articleWebFromJson(jsonEncode(response!.data));
      dataArticle.value = articles;
    } catch (e) {
      print("Error fetching articles: $e");
    }
  }

  // NOTE: for load more article
  void loadMoreArticles() {
    if (!isShowingAllArticles) {
      visibleArticleCount.value += 4;
    }
  }

  // NOTE: for load less article
  void showLessArticles() {
    visibleArticleCount.value = 4;
  }
}
