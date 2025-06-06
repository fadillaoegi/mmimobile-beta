import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/profile_controller.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/widget/item_list_widget.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/utils/image_converter_fldev.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/alert/alert_dialog_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.of(context).size;
    final userData = Get.put(UserController());
    final imageConvert = Get.put(ImageConverterFldev());
    final controller = Get.put(ProfileController());

    return Scaffold(
        body: CanvaFLdev(
      widget: Stack(
        children: [
          SafeArea(
              child: Obx(
            () => RefreshIndicator(
              onRefresh: () => controller.refreshData(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: SECTION 1
                    sectionOneProfile(userData, imageConvert, context),
                    // Obx(
                    //   () => sectionOneProfile(userData, imageConvert),
                    // ),
                    const SizedBox(height: 20.0),

                    // NOTE: SECTION 2
                    // GestureDetector(
                    //   onTap: () => controller.cr(context),
                    //   child: sectionTwoProfile(sizeScreen),
                    // ),
                    // Obx(
                    //   () => GestureDetector(
                    //     onTap: () => controller.cr(context),
                    //     child: sectionTwoProfile(sizeScreen),
                    //   ),
                    // ),
                    const SizedBox(height: 20.0),

                    // NOTE: SECTION 3
                    sectionThreeProfile(),
                  ],
                ),
              ),
            ),
          )),
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
        color: ColorApps.white,
      ),
      child: Column(
        children: [
          ItemList(
            onTap: () => Get.toNamed(Routes.profileEdit),
            label: "Ubah Profile",
            icon: Icons.person_outline,
          ),
          // ItemList(
          //   onTap: () => Get.toNamed(Routes.underDevelopment),
          //   label: "Voucher Saya",
          //   icon: Icons.assistant,
          // ),
          // ItemList(
          //   onTap: () => Get.toNamed(Routes.underDevelopment),
          //   label: "Pengaturan Notifikasi",
          //   icon: Icons.notification_important_outlined,
          // ),

          // ItemList(
          //   onTap: () => Get.toNamed(Routes.languageSetting),
          //   label: "Pengaturan Bahasa",
          //   icon: Icons.book_outlined,
          // ),
          // ItemList(
          //   onTap: () => Get.toNamed(Routes.accountSecurity),
          //   label: "Akun & keamanan",
          //   icon: Icons.security_outlined,
          // ),

          // ItemList(
          //   onTap: () => Get.toNamed(Routes.underDevelopment),
          //   label: "Rating Aplikasi",
          //   icon: Icons.star_border,
          //   // iconImage: AssetConfigFLdev.iconFaq,
          // ),
          ItemList(
            onTap: () {
              Get.dialog(
                  AlertDialogApps(
                    lotties: AssetConfigFLdev.lottieWarning,
                    title: 'Anda yakin ? ',
                    content: 'Keluar dari aplikasi',
                    textBtn: 'Ya',
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

  Widget sectionOneProfile(
    UserController userController,
    ImageConverterFldev imageConvert,
    BuildContext context,
  ) {
    final imageUrlUser = userController.user.customerPhotoProfil ?? "";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => controller.cr(context),
                child: Stack(
                  children: [
                    imageUrlUser.isNotEmpty
                        ? Obx(
                            () => ImageCircle(
                              size: 60.0,
                              edit: false,
                              imageUrl: imageUrlUser,
                              // AssetConfigFLdev.logoNetwork,
                            ),
                          )
                        : ImageCircle(
                            size: 60.0,
                            edit: false,
                            imageUrl:
                                "https://ui-avatars.com/api/?name=${userController.user.customerName}&background=6C8524&font-size=0.30&color=ffffff",
                            // AssetConfigFLdev.logoNetwork,
                          ),
                  ],
                )),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  String formattedText = HelperFldev.capitalizeFirstLetter(
                      HelperFldev.newParagraphText(
                          userController.user.customerName ?? "Guest", 20));
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
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                HelperFldev.safeHexToColor(controller
                    .membershipData.value.customerMembershipColorSecond
                    .toString()),
                HelperFldev.safeHexToColor(controller
                    .membershipData.value.customerMembershipColor
                    .toString()),
              ]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 2.0),
                Text(
                  userController.user.customerMembershipName.toString(),
                  style: white500.copyWith(fontSize: 14.0),
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
