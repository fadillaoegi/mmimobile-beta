import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class ItemListSupport extends StatelessWidget {
  const ItemListSupport(
      {super.key,
      required this.sizeScreen,
      this.imageUrl = "202504/7c7db9b1b795a5db53da27a05687c101.jpg",
      this.title = "Void title"});

  final Size sizeScreen;
  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.supportDetail),
      child: Container(
        width: sizeScreen.width,
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: boxShadow,
          color: ColorApps.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiApps.assetPatch}/$imageUrl', // ← Ganti dengan URL gambar sebenarnya
                width: sizeScreen.width,
                fit: BoxFit.cover,
                height: 242.0 / 2,
                placeholder: (context, url) =>
                    const Center(child: LoadingApps()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    // "Tutorial Make Up agar tidak luntur dan tahan lamaa",
                    style: black500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.video_collection_outlined,
                              color: ColorApps.disable),
                          const SizedBox(width: 8.0),
                          Text("15", style: disable500),
                        ],
                      ),
                      const SizedBox(width: 60.0),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined,
                              color: ColorApps.disable),
                          const SizedBox(width: 8.0),
                          Text("120 menit", style: disable500),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
