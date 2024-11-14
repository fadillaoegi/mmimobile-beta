import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
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
          height: sizeScreen.height / 4,
          width: sizeScreen.width,
          color: ColorApps.primary,
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
                        onTap: () {},
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
                ItemList(
                  onTap: () {},
                  label: "Website",
                  iconImage: AssetConfig.iconWebsite,
                ),
                ItemList(
                  onTap: () {},
                  label: "Partners",
                  iconImage: AssetConfig.iconPartners,
                ),
                ItemList(
                  onTap: () {},
                  label: "Privacy Policy",
                  iconImage: AssetConfig.iconPrivacyPolicy,
                ),
                ItemList(
                  onTap: () {},
                  label: "Copyright",
                  iconImage: AssetConfig.iconCopyright,
                ),
                ItemList(
                  onTap: () {},
                  label: "FAQ",
                  iconImage: AssetConfig.iconFaq,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
