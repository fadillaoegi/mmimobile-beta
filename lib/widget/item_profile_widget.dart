import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
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
                    style: disable2400.copyWith(fontSize: 13.0),
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: ColorApps.disable2,
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
