import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:mmimobile/app/widget/appbar_apps_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import '../controllers/account_security_controller.dart';

class AccountSecurityView extends GetView<AccountSecurityController> {
  const AccountSecurityView({super.key});
  @override
  Widget build(BuildContext context) {
    final userData = Get.put(UserController());
    return Scaffold(
      appBar: AppBarAppFLdev(
        title: "Akun & Keamanan",
      ),
      body: CanvaApps(
        widget: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTittle(
                title: "Akun",
                size: 16.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                      onTap: () => Get.toNamed(Routes.profileUpdateEmail),
                      label: "Email : \t\t ${userData.user.customerEmail}",
                      iconSize: 0.0,
                    ),
                    ItemList(
                      onTap: () => Get.toNamed(Routes.profileEditPassword),
                      label: "Ganti password",
                      iconSize: 0.0,
                    ),
                    ItemList(
                      onTap: () => Get.toNamed(Routes.underDevelopment),
                      label: "Kemanan biometri",
                      iconSize: 0.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SectionTittle(
                title: "Keamanan",
                size: 16.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
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
                      onTap: () => Get.toNamed(Routes.underDevelopment),
                      label: "Periksa aktivitas akun",
                      iconSize: 0.0,
                    ),
                    ItemList(
                      onTap: () => Get.toNamed(Routes.underDevelopment),
                      label: "Riwayat masuk",
                      iconSize: 0.0,
                    ),
                    ItemList(
                      onTap: () {
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
                      label: "Hapus akun",
                      iconSize: 0.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
