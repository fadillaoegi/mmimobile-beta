import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class ItemList extends StatelessWidget {
  const ItemList(
      {super.key,
      this.icon,
      this.iconImage = "",
      this.label = "",
      this.onTap,
      this.fontColor,
      this.iconSize = 22.0,
      this.fontSize = 14.0,
      this.widget});
  final String? label;
  final IconData? icon;
  final String? iconImage;
  final VoidCallback? onTap;
  final Color? fontColor;
  final double? fontSize;
  final double? iconSize;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8.0,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  iconImage == ""
                      ? Icon(
                          icon,
                          color: label == "Sign Out" || label == "Keluar"
                              ? ColorApps.error
                              : ColorApps.disable2,
                          size: iconSize,
                        )
                      : Image.asset(
                          iconImage!,
                          height: iconSize,
                          width: iconSize,
                        ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "$label",
                    style: label == "Sign Out" ||
                            label == "Keluar" ||
                            label == "Hapus akun"
                        ? error400.copyWith(fontSize: fontSize)
                        : disable2400.copyWith(fontSize: fontSize),
                  ),
                ],
              ),
              widget == null
                  ? Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: label == "Sign Out" ||
                              label == "Keluar" ||
                              label == "Hapus akun"
                          ? ColorApps.error
                          : ColorApps.disable2,
                      size: 22.0,
                    )
                  : widget!
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Divider(
          color:
              label == "Sign Out" || label == "Keluar" || label == "Hapus akun"
                  ? ColorApps.error
                  : ColorApps.disable2,
          thickness: 0.1,
        ),
      ],
    );
  }
}
