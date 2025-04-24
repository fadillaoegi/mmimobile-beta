import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import '../controllers/rating_product_controller.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/form/form_apps_fldev_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';

class RatingProductView extends GetView<RatingProductController> {
  const RatingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingProductController());

    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Rating Produk",
      ),
      body: CanvaFLdev(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Column(
                  children: List.generate(
                    controller.questionsSurveyRatings.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTittle(
                            title: controller.questionsSurveyRatings[index],
                            size: 14.0,
                          ),
                          const SizedBox(height: 10),
                          RatingBar.builder(
                            initialRating: controller.ratings[index],
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 40.0,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value) =>
                                controller.updateRating(index, value),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 20.0),
            SectionTittle(
              title:
                  "Berikan kritik dan saran Anda untuk peningkatan kualitas produk kami.",
              size: 14.0,
            ),
            const SizedBox(height: 10.0),
            FormAppsFLdev(
              maxLines: 3,
            ),
            const SizedBox(height: 20.0),
            BtnApps(
              onPress: () {},
              text: "Kirim",
            )
          ],
        ),
      ),
    );
  }
}
