import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/helper/helper_fldev.dart';
import '../controllers/profile_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
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
                  // NOTE: SECTION 1
                  sectionOneProfile(userController, "Prioritas"),

                  const SizedBox(height: 20.0),

                  // NOTE: SECTION 2
                  sectionTwoProfile(sizeScreen),

                  const SizedBox(height: 20.0),

                  // NOTE: SECTION 3
                  sectionThreeProfile(),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget sectionThreeProfile() {
    return Container(
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
            label: "Ubah Profile",
            icon: Icons.person_outline,
          ),
          ItemList(
            onTap: () => Get.toNamed(Routes.underDevelopment),
            label: "Voucher Saya",
            icon: Icons.assistant,
          ),
          ItemList(
            onTap: () => Get.toNamed(Routes.underDevelopment),
            label: "Pengaturan Notifikasi",
            icon: Icons.notification_important_outlined,
          ),

          ItemList(
            onTap: () => Get.toNamed(Routes.languageSetting),
            label: "Pengaturan Bahasa",
            icon: Icons.book_outlined,
          ),
          ItemList(
            onTap: () => Get.toNamed(Routes.underDevelopment),
            label: "Akun & keamanan",
            icon: Icons.security_outlined,
          ),

          ItemList(
            onTap: () => Get.toNamed(Routes.underDevelopment),
            label: "Rating Aplikasi",
            icon: Icons.star_border,
            // iconImage: AssetConfigFLdev.iconFaq,
          ),
          ItemList(
            onTap: () {
              Get.dialog(
                  AlertDialogApps(
                    lotties: AssetConfigFLdev.lottieWarning,
                    title: 'Anda yakin ? ',
                    content: 'Keluar dari aplikasi',
                    textBtn: 'yes',
                    onTap: () {
                      SessionUserFLdev.clearUser();
                      Get.offAllNamed(Routes.signIn);
                      Get.back();
                    },
                  ),
                  barrierDismissible: false);
            },
            label: "Keluar",
            icon: Icons.logout,
            // iconImage: AssetConfigFLdev.iconFaq,
          ),
          // ItemList(
          //   onTap: () async {
          //     await EasyLauncher.url(
          //       url: "https://mashmoshem.co.id/",
          //       mode: Mode.inAppWeb,
          //     );
          //   },
          //   label: "Website",
          //   iconImage: AssetConfigFLdev.iconWebsite,
          // ),
        ],
      ),
    );
  }

  Widget sectionTwoProfile(Size sizeScreen) {
    return Container(
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
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.reward),
                  child: Container(
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
                          style: disable2400,
                        ),
                        const SizedBox(width: 2.0),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sectionOneProfile(UserController userController, String membership) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
                child: Stack(
              children: [
                const ImageCircle(
                  edit: false,
                ),
              ],
            )),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  String formattedText = HelperFldev.newParagraphText(
                      userController.user.customerName ?? "Guest", 12);
                  return Text(
                    formattedText.length > 20
                        ? formattedText.substring(0, 20) + "..."
                        : formattedText,
                    style: secondary700.copyWith(fontSize: 16.0),
                  );
                }),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.membership),
          child: Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              // color: ColorApps.goldMember,
              gradient: LinearGradient(colors: [
                membership == "Gold"
                    ? ColorApps.goldMember
                    : membership == "Platinum"
                        ? ColorApps.platinumMember
                        : membership == "Prioritas"
                            ? ColorApps.prioritasMember
                            : ColorApps.silverMember,
                membership == "Gold"
                    ? ColorApps.goldMember2
                    : membership == "Platinum"
                        ? ColorApps.platinumMember2
                        : membership == "Prioritas"
                            ? ColorApps.prioritasMember2
                            : ColorApps.silverMember2,
              ]),
              // color: membership == "Gold"
              //     ? ColorApps.goldMember
              //     : membership == "Platinum"
              //         ? ColorApps.platinumMember
              //         : membership == "Prioritas"
              //             ? ColorApps.prioritasMember
              //             : ColorApps.silverMember,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 2.0),
                Text(
                  membership == "Gold"
                      ? "Gold"
                      : membership == "Platinum"
                          ? "Platinum"
                          : membership == "Prioritas"
                              ? "Prioritas"
                              : "Silver",
                  style: white500,
                ),
                const SizedBox(width: 2.0),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14.0,
                  color: ColorApps.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
