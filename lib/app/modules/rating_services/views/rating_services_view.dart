import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';

import '../controllers/rating_services_controller.dart';

class RatingServicesView extends GetView<RatingServicesController> {
  const RatingServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingServicesController());
    return Scaffold(
      appBar: AppBarAppFLdev(title: 'Rating Apps'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusRatingCardFLdev(controller: controller),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CardCommentFLdev();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCommentFLdev extends StatelessWidget {
  const CardCommentFLdev({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16.0,
              backgroundImage: AssetImage(AssetConfigFLdev.logo),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alifah',
                    style: black600.copyWith(fontSize: 12.0),
                  ),
                  Text(
                    '10-Februari-2025',
                    style: black400.copyWith(fontSize: 10.0),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    'Lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum lorem Ipsum lorem ipsum',
                    style: black500.copyWith(fontSize: 12.0),
                    softWrap: true, // Pastikan teks wrap
                    overflow:
                        TextOverflow.visible, // Pastikan overflow ditangani
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 8),
        const Divider()
      ],
    );
  }
}

class StatusRatingCardFLdev extends StatelessWidget {
  const StatusRatingCardFLdev({super.key, required this.controller});

  final RatingServicesController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => Column(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '${controller.averageRating.toStringAsFixed(1)}',
                  style: black600.copyWith(fontSize: 24.0),
                ),
                TextSpan(
                  text: ' / 5.0',
                  style: black400.copyWith(fontSize: 12.0),
                ),
              ])),
              Obx(() => Text(
                    'from ${controller.totalUsers} Users',
                    style: black400.copyWith(fontSize: 12.0),
                  )),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(5, (index) {
            return Obx(() => Row(
                  children: [
                    RatingBarIndicator(
                      rating: (index + 1).toDouble(),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 20.0,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '${controller.ratings[index]} users',
                      style: black400,
                    ),
                  ],
                ));
          }),
        ),
      ],
    );
  }
}
