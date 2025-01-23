import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

import '../controllers/reward_history_controller.dart';

class RewardHistoryView extends GetView<RewardHistoryController> {
  const RewardHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorApps.reward,
          ),
        ),
        centerTitle: true,
        title:
            Text("History Reward", style: reward600.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: SizedBox(
          height: sizeScreen.height,
          width: sizeScreen.width,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: const BoxDecoration(color: ColorApps.reward),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "100+",
                      style: white500.copyWith(),
                    ),
                    Text(
                      "Daily Sign in",
                      style: white500.copyWith(),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
