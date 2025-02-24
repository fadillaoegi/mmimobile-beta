import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/helper/helper_fldev.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import '../controllers/profile_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final userController = Get.put(UserController());
    return Scaffold(
        body: CanvaApps(
      widget: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
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
                                String formattedText = HelperFldev.formatText(
                                    userController.user.customerName ?? "Guest",
                                    12);
                                return Text(
                                  formattedText.length > 20
                                      ? formattedText.substring(0, 20) + "..."
                                      : formattedText,
                                  style: primary600.copyWith(fontSize: 16.0),
                                );
                              }),
                              const SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          color: ColorApps.card2,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 2.0),
                            Text(
                              "Platinum",
                              style: disable2700,
                            ),
                            const SizedBox(width: 2.0),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14.0,
                              color: ColorApps.disable2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  // NOTE:
                  Container(
                    width: sizeScreen.width,
                    height: 100.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: ColorApps.card2,
                      boxShadow: boxShadow,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Poin anda",
                          style: black300.copyWith(fontSize: 14.0),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AssetConfigFLdev.iconCoinNew,
                                    height: 50.0,
                                    width: 50.0,
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(FormatAppsFLdev.point("100000"),
                                      style: black400.copyWith(fontSize: 20.0))
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: ColorApps.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 2.0),
                                    Text(
                                      "Riwayat",
                                      style: primary400,
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: boxShadow,
                      color: ColorApps.cardTransparan,
                    ),
                    child: Column(
                      children: [
                        ItemList(
                          onTap: () => Get.toNamed(Routes.profileSetting),
                          label: "Pengaturan Profile",
                          icon: Icons.person_outline,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.underDevelopment),
                          label: "Pengaturan Notifikasi",
                          icon: Icons.notification_important_outlined,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.underDevelopment),
                          label: "Pengaturan Bahasa",
                          icon: Icons.book_outlined,
                        ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.underDevelopment),
                          label: "Akun & keamanan",
                          icon: Icons.security_outlined,
                        ),
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
                        // ItemList(
                        //   onTap: () => Get.toNamed(Routes.underDevelopment),
                        //   label: "Help center",
                        //   icon: Icons.help_outline,
                        // ),
                        // ItemList(
                        //   onTap: () => Get.toNamed(Routes.privacyPolicy),
                        //   label: "Privacy Policy",
                        //   iconImage: AssetConfigFLdev.iconPrivacyPolicy,
                        // ),
                        // ItemList(
                        //   onTap: () => Get.toNamed(Routes.faq),
                        //   label: "FAQ",
                        //   iconImage: AssetConfigFLdev.iconFaq,
                        // ),
                        // ItemList(
                        //   onTap: () => Get.toNamed(Routes.ratingService),
                        //   label: "Rating business services",
                        //   icon: Icons.star_border,
                        //   // iconImage: AssetConfigFLdev.iconFaq,
                        // ),
                        ItemList(
                          onTap: () => Get.toNamed(Routes.underDevelopment),
                          label: "Rating mmimobile",
                          icon: Icons.star_border,
                          // iconImage: AssetConfigFLdev.iconFaq,
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
    ));
  }
}
