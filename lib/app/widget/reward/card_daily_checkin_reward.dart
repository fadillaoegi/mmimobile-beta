import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/reward/item_reward_widget.dart';

class CardDailyCheckInReward extends StatelessWidget {
  const CardDailyCheckInReward({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeScreen.width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: ColorApps.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetConfigFLdev.iconPoint,
                    height: 24.0,
                    width: 24.0,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "322",
                    style: primary600.copyWith(fontSize: 30.0),
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(Routes.rewardHistory);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.history,
                        color: ColorApps.primary,
                        size: 30.0,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "History",
                        style: primary500.copyWith(fontSize: 16.0),
                      )
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "322 ", style: primary600.copyWith(fontSize: 12.0)),
              TextSpan(
                  text: "Point expired 31-12-2024",
                  style: black400.copyWith(fontSize: 12.0))
            ]),
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemDailyReward(),
              ItemDailyReward(),
              ItemDailyReward(),
              ItemDailyReward(),
              ItemDailyReward(),
              ItemDailyReward(),
              ItemDailyReward(),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          BtnApps(
            onPress: () {},
            text: "Check-in Today",
            borderRadius: 50.0,
            color: ColorApps.primary,
          ),
        ],
      ),
    );
  }
}
