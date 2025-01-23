import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/widget/profile/two_item_profile_widget.dart';
import '../controllers/profile_setting_controller.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    // final controller = Get.put(ProfileSettingController());
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Setting Profile",
              style: primary600.copyWith(fontSize: 20.0),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: ColorApps.primary,
              ),
            )
          ],
        ),
        scrolledUnderElevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: sizeScreen.width,
                height: sizeScreen.height / 4,
                decoration: BoxDecoration(color: ColorApps.primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ImageCircle(
                      size: 80.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Obx(
            () => TwoItemProfileSetting(
              onTap: () => Get.toNamed(Routes.profileEditName),
              title: "Name",
              value: userController.user.customerName.toString(),
              onTapTwo: () => Get.toNamed(Routes.profileUpdateEmail),
              titleTwo: "Email",
              valueTwo: userController.user.customerEmail.toString(),
            ),
          ),
          const SizedBox(height: 20.0),
          Obx(
            () => TwoItemProfileSetting(
              onTap: () {},
              title: "Phone",
              value: maskText(userController.user.customerPhone.toString()),
              onTapTwo: () => Get.toNamed(Routes.profileEditPassword),
              titleTwo: "Password",
              valueTwo: "********",
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

String maskText(String text) {
  if (text.length <= 4) {
    return text; // Jika teks kurang dari atau sama dengan 2 karakter, tidak perlu masking.
  }
  String visiblePart = text.substring(0, 4); // Ambil 2 huruf pertama.
  String maskedPart =
      '*' * (text.length - 4); // Ganti sisa teks dengan bintang.
  return '$visiblePart$maskedPart';
}
