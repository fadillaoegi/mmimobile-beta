import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';

import '../controllers/survey_complain_controller.dart';

class SurveyComplainView extends GetView<SurveyComplainController> {
  const SurveyComplainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Layanan komplain",
      ),
      body: CanvaApps(
        widget: Column(
          children: [
            Text(
              "Halo, apa ada yang bisa di bantu ?",
              style: black500.copyWith(fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
