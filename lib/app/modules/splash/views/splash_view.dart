import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/splash_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/configs/asset_config.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final controller = Get.find<SplashController>();
    return Obx(
      () => Scaffold(
        body: SizedBox(
          height: sizeScreen.height,
          width: sizeScreen.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AssetConfigFLdev.logo3,
                height: 60.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(
                    color: ColorApps.secondary,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    controller.message.value,
                    style: secondary500.copyWith(fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
