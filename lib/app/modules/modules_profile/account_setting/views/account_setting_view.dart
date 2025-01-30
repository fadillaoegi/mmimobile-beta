import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/out_btn_apps_widget.dart';
import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  const AccountSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBarApps(
        title: "Account setting",
      ),
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
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
            OutBtnApps(
              onPress: () {
                Get.dialog(
                    AlertDialogApps(
                      lotties: AssetConfigFLdev.lottieDelete,
                      title: 'Are you sure ?',
                      content: 'Delete account ',
                      textBtn: 'yes',
                      onTap: () {
                        Get.back();
                      },
                    ),
                    barrierDismissible: false);
              },
              text: 'Delete account',
            ),
          ],
        ),
      ),
    );
  }
}
