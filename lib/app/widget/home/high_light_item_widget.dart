import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/app/api/api.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class HighLightItem extends StatelessWidget {
  const HighLightItem(
      {super.key, this.image, this.title = "No title", this.onTap});

  final VoidCallback? onTap;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
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
              child: image!.isEmpty
                  ? const Icon(Icons.image_not_supported,
                      size: 40.0, color: Colors.grey)
                  : CachedNetworkImage(
                      imageUrl: "${ApiApps.assetPatch}/$image",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        height: 100,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: LoadingApps(),
                      ),
                      // placeholder: (context, url) =>
                      // const Center(child: LoadingApps()),
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
