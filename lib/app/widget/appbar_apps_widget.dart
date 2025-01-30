import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class AppBarApps extends StatelessWidget implements PreferredSizeWidget {
  const AppBarApps({
    super.key,
    this.title = "",
    this.checkClick = false,
    this.onTap,
  });

  final String? title;
  final bool? checkClick;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 26.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                title.toString(),
                style: primary600.copyWith(fontSize: 20.0),
              ),
            ],
          ),
          checkClick!
              ? IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.check_outlined,
                    color: ColorApps.primary,
                    size: 26.0,
                  ),
                )
              : SizedBox(),
        ],
      ),
      scrolledUnderElevation: 0.0,
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Perbaikan preferredSize
}
