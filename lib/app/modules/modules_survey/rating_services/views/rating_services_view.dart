import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../controllers/rating_services_controller.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class RatingServicesView extends GetView<RatingServicesController> {
  const RatingServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingServicesController());
    return Obx(() => ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          progressIndicator: LoadingApps(),
          child: Scaffold(
            appBar: AppBarAppFLdev(
              title: 'Rating layanan\nbusiness development',
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        itemCount: controller.questionsSurveyRatings.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionTittle(
                                  title: controller
                                      .questionsSurveyRatings[index]
                                      .masterSurveyDetailAssessment,
                                  size: 14.0,
                                ),
                                const SizedBox(height: 10),
                                Obx(() => RatingBar.builder(
                                      initialRating: controller.ratings[index],
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 40.0,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (value) =>
                                          controller.updateRating(index, value),
                                    )),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  // const SizedBox(height: 10.0),
                  // FormAppsFLdev(
                  //   maxLines: 3,
                  // ),
                  const SizedBox(height: 10.0),
                  BtnApps(
                    text: "Kirim",
                    onPress: () => controller.submitReview(),
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          ),
        ));
  }
}
