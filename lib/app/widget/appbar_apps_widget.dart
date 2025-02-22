import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class AppBarAppFLdev extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAppFLdev({
    super.key,
    this.title = "",
    this.checkClick = false,
    this.backRoute = true,
    this.onTap,
  });

  final String? title;
  final bool? checkClick;
  final bool? backRoute;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0x0077bba2),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              backRoute!
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 26.0,
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: backRoute! ? 10.0 : 0.0,
              ),
              Text(
                title.toString(),
                style: secondary600.copyWith(fontSize: 20.0),
              ),
            ],
          ),
          checkClick!
              ? IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.check_outlined,
                    color: ColorApps.secondary,
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
