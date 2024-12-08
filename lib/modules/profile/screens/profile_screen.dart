import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/styles/shadow.dart';
import 'package:mmimobile/widget/image_circle_widget.dart';
import 'package:mmimobile/widget/item_list_widget.dart';
import 'package:mmimobile/widget/profile/infomation_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: sizeScreen.height / 3,
          width: sizeScreen.width,
          decoration: const BoxDecoration(
              color: ColorApps.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              )),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          // Navigator.pushNamed(
                          //     context, RouteScreen.profileSetting);
                          goRouter.goNamed(RouteScreen.profileSetting);
                        },
                        child: const Icon(
                          Icons.settings,
                          color: ColorApps.white,
                          size: 30.0,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ImageCircle(),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "ALifah",
                      style: white600.copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InformationProfile(
                  width: sizeScreen,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: boxShadow,
                      color: ColorApps.white),
                  child: Column(
                    children: [
                      ItemList(
                        onTap: () async {
                          await EasyLauncher.url(
                              url: "https://mashmoshem.co.id/",
                              mode: Mode.inAppWeb);
                        },
                        label: "Website",
                        iconImage: AssetConfig.iconWebsite,
                      ),
                      ItemList(
                        onTap: () =>
                            goRouter.goNamed(RouteScreen.privacyPolicy),
                        label: "Privacy Policy",
                        iconImage: AssetConfig.iconPrivacyPolicy,
                      ),
                      ItemList(
                        onTap: () =>
                            // Navigator.pushNamed(context, RouteScreen.faq),
                            goRouter.goNamed(RouteScreen.faq),
                        label: "FAQ",
                        iconImage: AssetConfig.iconFaq,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
