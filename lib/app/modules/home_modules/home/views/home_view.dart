import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/home/carousel_home_widget.dart';
import 'package:mmimobile/app/widget/home/high_light_item_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final imageUrlUser = controller.userData.user.customerPhotoProfil ?? "";
    final sizeScreen = MediaQuery.sizeOf(context);

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => controller.refreshData(),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: sizeScreen.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                                          "https://ui-avatars.com/api/?name=${controller.userData.user.customerName}&background=6C8524&font-size=0.30&color=ffffff",
                                      // AssetConfigFLdev.logoNetwork,
                                    ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() {
                                    String formattedText =
                                        HelperFldev.capitalizeFirstLetter(
                                            HelperFldev.newParagraphText(
                                      (controller.userData.user.customerName ??
                                              "Guest")
                                          .toString(),
                                      20,
                                    ));

                                    return Text(
                                      formattedText.length > 20
                                          ? "${formattedText.substring(0, 20)}..."
                                          : formattedText,
                                      style:
                                          secondary700.copyWith(fontSize: 16.0),
                                    );
                                  }),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Obx(
                                        () {
                                          return GestureDetector(
                                            onTap: () =>
                                                Get.toNamed(Routes.membership),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 2.0),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    HelperFldev.safeHexToColor(
                                                        controller
                                                            .membershipData
                                                            .value
                                                            .customerMembershipColor
                                                            .toString()),
                                                    HelperFldev.safeHexToColor(
                                                        controller
                                                            .membershipData
                                                            .value
                                                            .customerMembershipColorSecond
                                                            .toString()),
                                                  ],
                                                  begin: Alignment.bottomRight,
                                                  end: Alignment.topLeft,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Text(
                                                controller.userData.user
                                                    .customerMembershipName
                                                    .toString(),
                                                style: white600.copyWith(
                                                    fontSize: 12.0),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text("|",
                                          style: secondary500.copyWith(
                                              fontSize: 14.0)),
                                      const SizedBox(width: 6.0),
                                      Text("0 Point",
                                          style: secondary500.copyWith(
                                              fontSize: 14.0)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          // IconButton(
                          //   onPressed: () => Get.snackbar(
                          //     "Welcome to MMI mobile",
                          //     "Signin success",
                          //     snackPosition: SnackPosition.TOP,
                          //   ),
                          //   icon: const Icon(
                          //     Icons.notifications_none_sharp,
                          //     color: ColorApps.secondary,
                          //     size: 30.0,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // NOTE: CAROUSEL HOME
                    CarouselHome(controller: controller),
                    const SizedBox(height: 20.0),

                    // NOTE: HIGH LIGHT
                    SectionTittle(title: "Best Ingredients for ODM"),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 140.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dataHighLightODM.length,
                        itemBuilder: (context, index) {
                          final image = controller
                              .dataHighLightODM[index].masterArticleImg;
                          final title = controller
                              .dataHighLightODM[index].masterArticleTitle;
                          final desc = controller
                              .dataHighLightODM[index].masterArticleDesc;
                          return HighLightItem(
                            title: title.toString(),
                            image: image.toString(),
                            onTap: () =>
                                Get.toNamed(Routes.detailHighLight, arguments: {
                              "title": title.toString(),
                              "image": image.toString(),
                              "desc": desc.toString(),
                            }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SectionTittle(title: "Ready to go OEM"),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 140.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.dataHighLightOEM.length,
                        itemBuilder: (context, index) {
                          final image = controller
                              .dataHighLightOEM[index].masterArticleImg;
                          final title = controller
                              .dataHighLightOEM[index].masterArticleTitle;
                          final desc = controller
                              .dataHighLightOEM[index].masterArticleDesc;

                          return HighLightItem(
                            title: title.toString(),
                            image: image.toString(),
                            onTap: () =>
                                Get.toNamed(Routes.detailHighLight, arguments: {
                              "title": title.toString(),
                              "image": image.toString(),
                              "desc": desc.toString(),
                            }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // // NOTE: ARTICLE
                    SectionTittle(title: "Article"),
                    const SizedBox(height: 10.0),

                    ListView.builder(
                      itemCount: controller.dataArticle.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final articlefetch = controller.dataArticle[index];
                        final title =
                            articlefetch.title?.rendered.toString() ?? "-";
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await EasyLauncher.url(
                                      url: articlefetch.link.toString(),
                                      mode: Mode.inAppWeb);
                                },
                                child: Container(
                                  width: sizeScreen.width,
                                  padding: const EdgeInsets.all(20.0),
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(6.0),
                                      ),
                                      boxShadow: boxShadow,
                                      color: ColorApps.white),
                                  child: Text(
                                    title.toString(),
                                    style: black400.copyWith(fontSize: 14.0),
                                    // textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
