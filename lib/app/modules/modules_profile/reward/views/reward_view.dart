import 'package:flutter/material.dart';
import '../controllers/reward_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/button/btn_apps_widget.dart';
import 'package:mmimobile/app/widget/reward/item_reward_widget.dart';
import 'package:mmimobile/app/widget/reward/item_history_reward_widget.dart';

class RewardView extends GetView<RewardController> {
  const RewardView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorApps.white,
            ),
          ),
          title: Text(
            "Hadiah",
            style: white600.copyWith(fontSize: 20.0),
          ),
          backgroundColor: ColorApps.secondary,
          automaticallyImplyLeading: false,
          actionsIconTheme: const IconThemeData(color: ColorApps.white),
        ),
        body: Stack(
          children: [
            Container(
              height: sizeScreen.height / 5,
              width: sizeScreen.width,
              decoration: const BoxDecoration(
                color: ColorApps.secondary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: SECTION 1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "322",
                              style: white700.copyWith(fontSize: 30.0),
                            ),
                            // InkWell(
                            //     onTap: () {
                            //       Get.toNamed(Routes.rewardHistory);
                            //     },
                            //     child: Row(
                            //       children: [
                            //         const Icon(
                            //           Icons.history,
                            //           color: ColorApps.white,
                            //           size: 30.0,
                            //         ),
                            //         const SizedBox(
                            //           width: 8.0,
                            //         ),
                            //         Text(
                            //           "History",
                            //           style: white500.copyWith(fontSize: 16.0),
                            //         )
                            //       ],
                            //     ))
                          ],
                        ),
                        Text.rich(TextSpan(children: [
                          // TextSpan(text: "322 ", style: white600.copyWith()),
                          TextSpan(
                              // text: "Point expired 31-12-2024",
                              text: "Poin kedaluarsa sampai 31-12-2024",
                              style: white400.copyWith())
                        ]))
                      ],
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),

                    // NOTE: SECTION 2
                    Container(
                      width: sizeScreen.width,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          boxShadow: boxShadow,
                          color: ColorApps.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            borderRadius: 50.0,
                            onPress: () {},
                            text: "Check-in hari ini",
                            color: ColorApps.secondary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // NOTE: SECTION 3
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        boxShadow: boxShadow,
                        color: ColorApps.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Riwayat Hadiah",
                            style: black400.copyWith(fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // itemBuilder: (context, index) => const ItemMission(),
                            itemBuilder: (context, index) =>
                                ItemHistoryReward(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
