import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/helper/helper_fldev.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/banner_information_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mmimobile/app/modules/modules_auth/data/controller/user_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SECTION 1
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const ImageCircle(
                                size: 60.0,
                                edit: false,
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    String formattedText =
                                        HelperFldev.formatText(
                                            userController.user.customerName ??
                                                "Guest",
                                            20);
                                    return Text(
                                      formattedText.length > 20
                                          ? formattedText.substring(0, 20) +
                                              "..."
                                          : formattedText,
                                      style:
                                          primary700.copyWith(fontSize: 14.0),
                                    );
                                  }),
                                  Row(
                                    children: [
                                      Text(
                                        "Diamond",
                                        style:
                                            primary400.copyWith(fontSize: 12.0),
                                      ),
                                      Text(
                                        "*",
                                        style:
                                            primary400.copyWith(fontSize: 12.0),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        "200 ",
                                        style:
                                            primary400.copyWith(fontSize: 12.0),
                                      ),
                                      Text(
                                        "Point",
                                        style:
                                            primary400.copyWith(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () => Get.toNamed(Routes.notification),
                            icon: const Icon(
                              Icons.notifications_none_sharp,
                              color: ColorApps.primary,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Banner Information
                    BannerInformation(sizeScreen: sizeScreen),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
