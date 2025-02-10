import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/rating_services/controllers/rating_services_controller.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class DashboardRatingCardFLdev extends StatelessWidget {
  const DashboardRatingCardFLdev({super.key, required this.controller});

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
