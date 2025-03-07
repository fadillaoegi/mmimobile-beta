import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
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
    // final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Survei",
        backRoute: false,
      ),
      body: CanvaApps(
        // color: const Color.fromARGB(255, 28, 34, 11),
        widget: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Text(
                  "Selamat datang di halaman\nsurvey",
                  textAlign: TextAlign.center,
                  style: secondary700.copyWith(
                    fontSize: 20.0,
                    // shadows: boxShadow,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 50.0,
              // ),
              CardFLdev(
                padding: 14.0,
                margin: 14.0,
                color: ColorApps.card2,
                child: Column(
                  children: [
                    ItemList(
                      label: "Rating layanan\nbusiness development",
                      iconImage: AssetConfigFLdev.iconServiceBusiness,
                      iconSize: 40.0,
                      onTap: () => Get.toNamed(Routes.ratingService),
                    ),
                    ItemList(
                      label: "Rating kualitas produk kami",
                      iconImage: AssetConfigFLdev.iconQualityProduct,
                      iconSize: 40.0,
                      onTap: () => Get.toNamed(Routes.ratingProduct),
                    ),
                    ItemList(
                      label: "Layanan komplain pelanggan",
                      iconImage: AssetConfigFLdev.iconComplainService,
                      iconSize: 40.0,
                      onTap: () => Get.toNamed(Routes.surveyComplain),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "Dapatkan poin di setiap rating yang\nAnda berikan",
                textAlign: TextAlign.center,
                style: secondary500.copyWith(
                  fontSize: 18.0,
                  // shadows: boxShadow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
