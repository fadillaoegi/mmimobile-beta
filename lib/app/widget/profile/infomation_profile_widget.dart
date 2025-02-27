import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
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
          color: ColorApps.white,
          // color: Color(0x7077bba2),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: boxShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              colors: [ColorApps.primary, ColorApps.secondary],
            ),
            unselectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorApps.icon,
                ColorApps.white,
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Tingkatkan pembelanjaan anda hingga 30.06.2025 untuk tetap berada di Platinum",
            style: secondary400.copyWith(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
