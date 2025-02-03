import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/widget/profile/infomation_profile_widget.dart';
import '../controllers/profile_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/reward/card_daily_checkin_reward.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final userController = Get.put(UserController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: sizeScreen.height / 4,
            width: sizeScreen.width,
            decoration: const BoxDecoration(
              color: ColorApps.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0.0),
                bottomLeft: Radius.circular(0.0),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.accountSetting);
                        },
                        child: const Icon(
                          Icons.settings,
                          color: ColorApps.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () => Get.toNamed(Routes.profileSetting),
                          child: Stack(
                            children: [
                              const ImageCircle(),
                            ],
                          )),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            String formattedText = formatText(
                                userController.user.customerName ?? "Guest",
                                10);
                            return Text(
                              formattedText.length > 20
                                  ? formattedText.substring(0, 20) + "..."
                                  : formattedText,
                              // userController.user.customerName ?? "Guest",
                              style: white600.copyWith(fontSize: 16.0),
                            );
                          }),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: ColorApps.white,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 2.0),
                            Image.asset(
                              AssetConfigFLdev.iconLevelDiamond,
                              height: 14.0,
                              width: 14.0,
                            ),
                            const SizedBox(width: 2.0),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  // CardDailyCheckInReward(sizeScreen: sizeScreen),
                  InformationProfile(width: sizeScreen),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: boxShadow,
                      color: ColorApps.white,
                    ),
                    child: Column(
                      children: [
                        ItemList(
                          onTap: () async {
                            await EasyLauncher.url(
                              url: "https://mashmoshem.co.id/",
                              mode: Mode.inAppWeb,
                            );
                          },
                          label: "Website",
                          iconImage: AssetConfigFLdev.iconWebsite,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.privacyPolicy),
                          label: "Privacy Policy",
                          iconImage: AssetConfigFLdev.iconPrivacyPolicy,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.faq),
                          label: "FAQ",
                          iconImage: AssetConfigFLdev.iconFaq,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatText(String text, int maxLength) {
    List<String> chunks = [];
    for (int i = 0; i < text.length; i += maxLength) {
      chunks.add(text.substring(
          i, i + maxLength > text.length ? text.length : i + maxLength));
    }
    return chunks.join("\n");
  }
}
