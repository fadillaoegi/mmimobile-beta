import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmimobile/app/styles/color.dart';

class AppBarAppFLdev extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAppFLdev({
    super.key,
    this.title = "",
    this.checkClick = false,
    this.backRoute = false,
    this.onTap,
    // this.color = ColorApps.card3,
    this.color = ColorApps.white,
    this.colorFontIcon = ColorApps.secondary,
    // this.colorFontIcon = ColorApps.white,
  });

  final String? title;
  final bool? checkClick;
  final bool? backRoute;
  final VoidCallback? onTap;
  final Color? color;
  final Color? colorFontIcon;
  // final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      // backgroundColor: Color(0x0077bba2),
      backgroundColor: color,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              backRoute!
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24.0,
                        color: colorFontIcon,
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: backRoute! ? 00.0 : 0.0,
              ),
              Text(
                title.toString(),
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: colorFontIcon,
                    fontSize: 20.0),
              ),
            ],
          ),
          checkClick!
              ? IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.check_outlined,
                    color: colorFontIcon,
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
