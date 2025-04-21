import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';
import '../controllers/home_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/helpers/helper_fldev.dart';
import 'package:mmimobile/app/widget/canva_apps_widget.dart';
import 'package:mmimobile/app/widget/image_circle_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mmimobile/app/widget/section_title_widget.dart';
import 'package:mmimobile/app/widget/home/carousel_home_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final imageUrlUser = controller.userData.user.customerPhotoProfil ?? "";

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => controller.refreshData(),
                child: SingleChildScrollView(
                    child: CanvaApps(
                  widget: Column(
                    children: [
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        String formattedText =
                                            HelperFldev.capitalizeFirstLetter(
                                                HelperFldev.newParagraphText(
                                          (controller.userData.user
                                                      .customerName ??
                                                  "Guest")
                                              .toString(),
                                          20,
                                        ));

                                        return Text(
                                          formattedText.length > 20
                                              ? "${formattedText.substring(0, 20)}..."
                                              : formattedText,
                                          style: secondary700.copyWith(
                                              fontSize: 16.0),
                                        );
                                      }),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        children: [
                                          Obx(
                                            () {
                                              return Container(
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
                                                    begin:
                                                        Alignment.bottomRight,
                                                    end: Alignment.topLeft,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Text(
                                                  controller.userData.user
                                                      .customerMembershipName
                                                      .toString(),
                                                  style: white600.copyWith(
                                                      fontSize: 12.0),
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
                              IconButton(
                                onPressed: () => Get.snackbar(
                                  "Welcome to MMI mobile",
                                  "Signin success",
                                  snackPosition: SnackPosition.TOP,
                                ),
                                icon: const Icon(
                                  Icons.notifications_none_sharp,
                                  color: ColorApps.secondary,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
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
                        height: 130.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dataHighLightODM.length,
                          itemBuilder: (context, index) {
                            final image = controller
                                .dataHighLightODM[index].masterArticleImg;
                            final title = controller
                                .dataHighLightODM[index].masterArticleTitle;
                            print(image);
                            return highlight(() {},
                                image: image.toString(),
                                title: title.toString());
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SectionTittle(title: "Ready to go OEM"),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 160.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.dataHighLightODM.length,
                          itemBuilder: (context, index) {
                            final image = controller
                                .dataHighLightODM[index].masterArticleImg;
                            final title = controller
                                .dataHighLightODM[index].masterArticleTitle;

                            return highlight(() {},
                                image: image.toString(),
                                title: title.toString());
                          },
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget highlight(
    VoidCallback onTap, {
    String title = "title",
    String image = "",
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100.0,
            width: 120.0,
            margin: const EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: boxShadow,
              color: Colors.grey[200], // default bg color jika gambar gagal
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image.isEmpty
                  ? const Icon(Icons.image_not_supported,
                      size: 40.0, color: Colors.grey)
                  : CachedNetworkImage(
                      imageUrl: "${ApiApps.assetPatch}/$image",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: LoadingApps()),
                      errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey)),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          style: black500.copyWith(fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
