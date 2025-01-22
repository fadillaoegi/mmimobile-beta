import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import '../controllers/profile_controller.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/profile/infomation_profile_widget.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';

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
                          Get.toNamed(Routes.profileSetting);
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
                      const ImageCircle(),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              userController.user.customerName ?? "Guest",
                              style: white600.copyWith(fontSize: 16.0),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 5.0,
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
                              AssetConfig.iconLevelDiamond,
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
                  InformationProfile(width: sizeScreen),
                  const SizedBox(height: 40.0),
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
                          iconImage: AssetConfig.iconWebsite,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.privacyPolicy),
                          label: "Privacy Policy",
                          iconImage: AssetConfig.iconPrivacyPolicy,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.faq),
                          label: "FAQ",
                          iconImage: AssetConfig.iconFaq,
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
}
