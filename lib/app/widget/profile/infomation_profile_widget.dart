import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InformationProfile extends StatelessWidget {
  const InformationProfile({
    super.key,
    this.width,
  });

  final Size? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width!.width,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: ColorApps.card,
          // color: Color(0x7077bba2),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: boxShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Level",
                    style: white700.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          AssetConfigFLdev.iconRatingGold,
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          "Gold",
                          style: white700.copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                children: [
                  Text(
                    "Point",
                    style: white700.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.reward),
                    // Navigator.pushNamed(context, RouteScreen.reward),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetConfigFLdev.iconPoint,
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          "455",
                          style: white700.copyWith(fontSize: 14.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                AssetConfigFLdev.iconLevelDiamond,
                height: 20.0,
                width: 20.0,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const StepProgressIndicator(
            totalSteps: 100,
            currentStep: 32,
            size: 8,
            padding: 0,
            selectedColor: Colors.yellow,
            unselectedColor: Colors.cyan,
            roundedEdges: Radius.circular(10),
            selectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorApps.primary, ColorApps.blue],
            ),
            unselectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorApps.icon, ColorApps.white],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Levelmu semakin dekat dengan level diamond",
            style: white400.copyWith(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
