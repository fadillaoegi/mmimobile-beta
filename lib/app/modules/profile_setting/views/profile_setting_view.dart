import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final controller = Get.put(ProfileSettingController());
    return Scaffold(
      appBar: AppBar(
        // leading: ,
        centerTitle: true,
        title:
            Text("Setting Profile", style: primary700.copyWith(fontSize: 20.0)),
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: sizeScreen.width,
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorApps.white,
              boxShadow: boxShadow),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const ImageCircle(
                size: 100.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Edit Photo",
                  style: disable2500.copyWith(fontSize: 14.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ItemList(
                onTap: () {
                  Get.toNamed(Routes.profileEdit);
                },
                label: "Edit Profile",
                icon: Icons.person,
              ),
              ItemList(
                onTap: () {
                  Get.toNamed(Routes.profileEditPassword);
                },
                label: "Edit Password",
                icon: Icons.lock_outline,
              ),
              ItemList(
                onTap: () {
                  Get.toNamed(Routes.profileEditPassword);
                },
                label: "Edit Phone Number",
                icon: Icons.phone_android,
              ),
              ItemList(
                onTap: () {
                  Get.dialog(
                      AlertDialogApps(
                        onTap: () {
                          Get.offAllNamed(Routes.signIn);
                        },
                        lotties: AssetConfig.lottieDelete,
                        title: "Are you sure ?",
                        content: "Delete Account",
                        textBtn: "Yes",
                      ),
                      barrierDismissible: false);
                },
                label: "Delete Account",
                icon: Icons.delete_forever_outlined,
              ),
              ItemList(
                onTap: () {
                  Get.dialog(
                    barrierDismissible: false,
                    AlertDialogApps(
                      onTap: () => controller.logout(),
                      lotties: AssetConfig.lottieLogout2,
                      title: "Are you sure ?",
                      content: "Sign Out",
                      textBtn: "Yes",
                    ),
                  );
                },
                label: "Sign Out",
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
