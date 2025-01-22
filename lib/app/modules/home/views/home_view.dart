import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/modules/auth/data/controller/user_controller.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/banner_information_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/transparant_card_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final sizeScreen = MediaQuery.of(context).size;
    print(userController.user.customerName);

    return Scaffold(
      body: SizedBox(
        height: sizeScreen.height,
        width: sizeScreen.width,
        child: Stack(
          children: [
            Container(
              height: sizeScreen.height / 2.5,
              width: sizeScreen.width,
              decoration: const BoxDecoration(
                color: ColorApps.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SECTION 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const ImageCircle(size: 40.0),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      userController.user.customerName ??
                                          "Guest",
                                      style: white600.copyWith(fontSize: 14.0),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Diamond",
                                        style:
                                            white300.copyWith(fontSize: 12.0),
                                      ),
                                      Text(
                                        "*",
                                        style:
                                            white300.copyWith(fontSize: 12.0),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        "200 ",
                                        style:
                                            white300.copyWith(fontSize: 12.0),
                                      ),
                                      Text(
                                        "Point",
                                        style:
                                            white300.copyWith(fontSize: 12.0),
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
                              color: ColorApps.white,
                              size: 30.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: sizeScreen.height / 25),
                      SizedBox(height: sizeScreen.height / 30),
                      // Transparant Card Section 2
                      TransparantCard(
                        width: sizeScreen.width,
                        opacity: 1,
                        childern: [
                          for (var i = 0; i < 3; i++)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Informasi", style: black500),
                                const SizedBox(height: 60.0),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Banner Information
                      BannerInformation(sizeScreen: sizeScreen),
                      const SizedBox(height: 20.0),
                      BannerInformation(sizeScreen: sizeScreen),
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
}
