import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class ItemMission extends StatelessWidget {
  const ItemMission(
      {super.key,
      this.missionName = "",
      this.pointPrice = 0,
      this.claimed = true});

  final String? missionName;
  final int? pointPrice;
  final bool? claimed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorApps.white,
          boxShadow: [
            BoxShadow(
              color: ColorApps.black.withValues(alpha: 0.10), // Warna bayangan
              spreadRadius: 1, // Seberapa jauh shadow menyebar
              blurRadius: 10, // Seberapa halus blur shadow
              offset: const Offset(0, 7), // Offset shadow (X, Y)
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AssetConfigFLdev.logo,
                height: 60.0,
                width: 60.0,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$missionName",
                    style: claimed!
                        ? disable500.copyWith(fontSize: 12.0)
                        : black500.copyWith(fontSize: 14.0),
                  ),
                  Text(
                    "$pointPrice point",
                    style: claimed!
                        ? disable500.copyWith(fontSize: 12.0)
                        : disable2500.copyWith(fontSize: 12.0),
                  ),
                ],
              )
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: claimed! ? ColorApps.disable : ColorApps.primary,
                    width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "Claim",
                style: claimed! ? disable400.copyWith() : primary400.copyWith(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
