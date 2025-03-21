import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({
    super.key,
    this.size = 60.0,
    this.edit = true,
    required this.imageUrl,
    this.onTap,
  });

  final double size;
  final bool edit;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                cacheKey: imageUrl + DateTime.now().microsecond.toString(),
                // cacheManager: ,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: size,
                  height: size,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: LoadingApps(),
                ),
                errorWidget: (context, url, error) => Container(
                  width: size,
                  height: size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Icon(Icons.error, color: Colors.red, size: size / 2),
                ),
              ),
            ),
            if (edit)
              Positioned(
                bottom: -3,
                right: -3,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 24.0,
                    width: 24.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(174, 255, 255, 255),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(56, 0, 0, 0),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.edit,
                        size: 14, color: ColorApps.secondary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomCacheManager extends CacheManager {
  static const key = "customCacheKey";

  static final instance = CustomCacheManager._();

  CustomCacheManager._() : super(Config(key));

  static Future<void> clearCache() async {
    await instance.emptyCache();
  }
}
