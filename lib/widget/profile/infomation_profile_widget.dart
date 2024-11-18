import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
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
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: ColorApps.black.withOpacity(0.10), // Warna bayangan
              spreadRadius: 0, // Seberapa jauh shadow menyebar
              blurRadius: 0.6, // Seberapa halus blur shadow
              offset: const Offset(0, 5), // Offset shadow (X, Y)
            )
          ]),
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
                    style: black400.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          AssetConfig.iconRatingGold,
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          "Gold",
                          style: black500.copyWith(fontSize: 14.0),
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
                    style: black400.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteScreen.reward),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetConfig.iconPoint,
                          height: 20.0,
                          width: 20.0,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          "455",
                          style: black500.copyWith(fontSize: 14.0),
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
                AssetConfig.iconLevelDiamond,
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
              colors: [ColorApps.blue, ColorApps.blue],
            ),
            unselectedGradientColor: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorApps.icon, ColorApps.icon],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Levelmu semakin dekat dengan level diamond",
            style: black400.copyWith(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
