import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';

import '../controllers/underdevelopment_controller.dart';

class UnderdevelopmentView extends GetView<UnderdevelopmentController> {
  const UnderdevelopmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: 'Underdevelopment',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetConfigFLdev.underdevMmi),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            'Underdevelopment',
            style: black400.copyWith(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
