import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/helper/helper_fldev.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/out_btn_apps_widget.dart';
import 'package:mmimobile/app/widget/profile/two_item_profile_widget.dart';
import '../controllers/profile_setting_controller.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final userController = Get.find<UserController>();

    return Scaffold(
        appBar: AppBarAppFLdev(
          title: "Setting Profile",
          checkClick: true,
          onTap: () {},
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: sizeScreen.width,
                        height: sizeScreen.height / 4,
                        decoration:
                            const BoxDecoration(color: ColorApps.secondary),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageCircle(size: 80.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Obx(() => TwoItemProfileSetting(
                        onTap: () => Get.toNamed(Routes.profileEditName),
                        title: "Name",
                        value: userController.user.customerName ?? "Unknown",
                        onTapTwo: () => Get.toNamed(Routes.profileUpdateEmail),
                        titleTwo: "Email",
                        valueTwo:
                            userController.user.customerEmail ?? "Unknown",
                      )),
                  const SizedBox(height: 20.0),
                  Obx(
                    () => TwoItemProfileSetting(
                      onTap: () => Get.toNamed(Routes.profileUpdatePhone),
                      title: "Phone",
                      value: HelperFldev.maskText(
                          userController.user.customerPhone ?? "No Phone"),
                      onTapTwo: () => Get.toNamed(Routes.profileEditPassword),
                      titleTwo: "Password",
                      valueTwo: "********",
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TwoItemProfileSetting(
                    onTap: () => Get.toNamed(Routes.profileUpdateAddress),
                    title: "Address",
                    activeSectionTwo: false,
                    value: userController.user.customerAddress ?? "No Address",
                    onTapTwo: () => Get.toNamed(Routes.profileEditPassword),
                    titleTwo: "Password",
                    valueTwo: "********",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        OutBtnApps(
                          onPress: () {
                            Get.dialog(
                                AlertDialogApps(
                                  lotties: AssetConfigFLdev.lottieWarning,
                                  title: 'Are you sure ?',
                                  content: 'Logout from apps',
                                  textBtn: 'yes',
                                  onTap: () {
                                    SessionUserFLdev.clearUser();
                                    Get.offAllNamed(Routes.signIn);
                                    Get.back();
                                  },
                                ),
                                barrierDismissible: false);
                          },
                          text: 'Logout',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        // OutBtnApps(
                        //   onPress: () {

                        //   },
                        //   text: 'Delete account',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
