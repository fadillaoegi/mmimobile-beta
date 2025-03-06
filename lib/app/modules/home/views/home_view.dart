import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/snackbar_wiget.dart';
import 'package:mmimobile/app/widget/system_support/carousel_widget.dart';
import '../controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/helper/helper_fldev.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final controller = Get.put(HomeController());
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      //  appBar: PreferredSize(
      //     preferredSize:
      //         const Size.fromHeight(120.0), // Tinggi AppBar diperpanjang
      //     child: AppBar(
      //       backgroundColor: ColorApps.white,
      //       elevation: 0.0,
      //       titleSpacing: 0.0,
      //       flexibleSpace: SafeArea(
      //         child: sectionOneHome(userController),
      //       ),
      //     ),
      //   ),
      body: SizedBox(
        height: sizeScreen.height,
        width: sizeScreen.width,
        child: Stack(
          children: [
            Container(
              height: sizeScreen.height,
              width: sizeScreen.width,
              decoration: const BoxDecoration(
                color: ColorApps.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
            ),
            SafeArea(
              child: CanvaApps(
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      // NOTE: SECTION 1
                      sectionOneHome(userController),
                      const SizedBox(height: 20.0),

                      // NOTE: SECTION 2
                      CarouselSystemSupport(controller: controller),
                      const SizedBox(height: 20.0),

                      // NOTE: SECTION 3
                      SectionTittle(
                        title: "Best Ingredients for ODM",
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example1,
                          ),
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example2,
                          ),
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example3,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0),

                      // NOTE: ECTION 4
                      SectionTittle(
                        title: "Ready to go OEM",
                      ),
                      const SizedBox(height: 10.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example1,
                          ),
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example2,
                          ),
                          highlight(
                            () {},
                            image: AssetConfigFLdev.example3,
                          ),
                        ],
                      ),

                      // BannerInformation(sizeScreen: sizeScreen),
                      // BannerInformation(sizeScreen: sizeScreen),
                      // BannerInformation(sizeScreen: sizeScreen),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column highlight(VoidCallback onTap,
      {String title = "title", String image = ""}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100.0,
            width: 116.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: boxShadow,
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          title,
          style: black500.copyWith(fontSize: 14.0),
        )
      ],
    );
  }

  Widget sectionOneHome(UserController userController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ImageCircle(
              size: 70.0,
              edit: false,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  String formattedText = HelperFldev.newParagraphText(
                      userController.user.customerName ?? "Guest", 20);
                  return Text(
                    formattedText.length > 20
                        ? formattedText.substring(0, 20) + "..."
                        : formattedText,
                    style: secondary700.copyWith(fontSize: 16.0),
                  );
                }),
                Row(
                  children: [
                    Text(
                      "Diamond",
                      style: secondary500.copyWith(fontSize: 14.0),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      "|",
                      style: secondary500.copyWith(fontSize: 14.0),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      "200 ",
                      style: secondary500.copyWith(fontSize: 12.0),
                    ),
                    Text(
                      "Point",
                      style: secondary500.copyWith(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        IconButton(
          // onPressed: () => Get.toNamed(Routes.notification),
          onPressed: () => SnackbarFLdev.snackShow(
              title: "Welcome to MMI mobile", message: "Signin success"),
          icon: const Icon(
            Icons.notifications_none_sharp,
            color: ColorApps.secondary,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
