import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    this.icon,
    this.iconImage = "",
    this.label = "",
    this.onTap,
  });
  final String? label;
  final IconData? icon;
  final String? iconImage;
  final VoidCallback? onTap;

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
                          color: ColorApps.icon2,
                          size: 22.0,
                        )
                      : Image.asset(
                          iconImage!,
                          height: 22.0,
                          width: 22.0,
                        ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "$label",
                    style: label == "Sign Out"
                        ? error400.copyWith(fontSize: 13.0)
                        : disable2400.copyWith(fontSize: 13.0),
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color:
                    label == "Sign Out" ? ColorApps.error : ColorApps.disable2,
                size: 22.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
      ],
    );
  }
}
