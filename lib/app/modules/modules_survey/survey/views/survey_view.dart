import 'package:flutter/material.dart';
import '../controllers/survey_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/transparant_card_widget.dart';

class SurveyView extends GetView<SurveyController> {
  const SurveyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Survei",
        backRoute: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardFLdev(
            padding: 14.0,
            margin: 14.0,
            color: ColorApps.card2,
            child: Column(
              children: [
                ItemList(
                  label: "Penilaian layanan bisnis",
                  iconImage: AssetConfigFLdev.iconServiceBusiness,
                  iconSize: 40.0,
                  onTap: () => Get.toNamed(Routes.ratingService),
                ),
                ItemList(
                  label: "Penilaian kualitas produk",
                  iconImage: AssetConfigFLdev.iconQualityProduct,
                  iconSize: 40.0,
                ),
                ItemList(
                  label: "Layanan komplain pelanggan",
                  iconImage: AssetConfigFLdev.iconComplainService,
                  iconSize: 40.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
