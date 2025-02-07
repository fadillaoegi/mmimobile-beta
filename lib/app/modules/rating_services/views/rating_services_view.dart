import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/styles/fonts.dart';

import '../controllers/rating_services_controller.dart';

class RatingServicesView extends GetView<RatingServicesController> {
  const RatingServicesView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingServicesController());
    return Scaffold(
      appBar: AppBar(title: Text('Rating Status')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                          style: black500,
                        )
                      ],
                    ));
              }),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
                  'Total Users Rated: ${controller.totalUsers}',
                  style: black500,
                )),
            SizedBox(height: 10),
            Obx(() => Text(
                  'Average Rating: ${controller.averageRating.toStringAsFixed(1)}',
                  style: black400.copyWith(fontSize: 20.0),
                )),
          ],
        ),
      ),
    );
  }
}
