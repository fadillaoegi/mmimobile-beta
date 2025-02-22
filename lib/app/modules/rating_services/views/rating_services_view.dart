import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/card_comment_fldev_widget.dart';
import 'package:mmimobile/app/widget/dashboard_rating_fdldev_widget.dart';
import '../controllers/rating_services_controller.dart';

class RatingServicesView extends GetView<RatingServicesController> {
  const RatingServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingServicesController());
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: 'Rating Apps',
        backRoute: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardRatingCardFLdev(controller: controller),
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
