import 'package:flutter/material.dart';
import '../controllers/survey_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mmimobile/app/widget/transparant_card_widget.dart';

class SurveyView extends GetView<SurveyController> {
  const SurveyView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SurveyController());
    return Obx(
      () => Scaffold(
        appBar: AppBarAppFLdev(
          title: "Survei",
          backRoute: false,
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.refresh(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "Selamat datang di halaman\nsurvey",
                    textAlign: TextAlign.center,
                    style: secondary700.copyWith(
                      fontSize: 20.0,
                      // shadows: boxShadow,
                    ),
                  ),
                ),
                CardFLdev(
                  padding: 14.0,
                  margin: 14.0,
                  color: ColorApps.card2,
                  child: Column(
                      children: List.generate(
                    controller.listSurveyMenu.length,
                    (index) {
                      final surveyMenuName = controller
                          .listSurveyMenu[index].masterSurveyTitle
                          .toString();
                      final surveyMenuId = controller
                          .listSurveyMenu[index].masterSurveyId
                          .toString();
                      final surveyMenuPoint = controller
                          .listSurveyMenu[index].masterSurveyPoint
                          .toString();
                      return ItemList(
                        label: surveyMenuName.toString(),
                        iconImage: AssetConfigFLdev.iconServiceBusiness,
                        iconSize: 40.0,
                        onTap: () =>
                            Get.toNamed(Routes.ratingService, arguments: {
                          'surveyMenuId': surveyMenuId,
                          'surveyMenuPoint': surveyMenuPoint,
                        }),
                      );
                    },
                  ).toList()),
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
      ),
    );
  }
}
