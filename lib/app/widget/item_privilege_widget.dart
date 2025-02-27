import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class ItemPrivilege extends StatelessWidget {
  const ItemPrivilege(
      {super.key,
      this.privilagenName = "",
      this.privilagecount = "0",
      this.pointPrice = 0,
      this.claimed = false,
      this.onTap});

  final String privilagenName;
  final String privilagecount;
  final int pointPrice;
  final bool? claimed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorApps.white,
        boxShadow: boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                      // color: const Color.fromARGB(180, 109, 133, 36),
                      color: ColorApps.primary,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Center(
                    child: Text(
                      privilagecount,
                      style: secondary700.copyWith(fontSize: 20.0),
                    ),
                  ),
                ),
                // Image.asset(
                //   AssetConfigFLdev.logo,
                //   height: 50.0,
                //   width: 50.0,
                // ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // HelperFldev.newParagraphText(missionName, 22),
                        privilagenName,
                        style: claimed!
                            ? disable500.copyWith(fontSize: 12.0)
                            : black500.copyWith(fontSize: 14.0),
                        // overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: claimed! ? ColorApps.disable : ColorApps.secondary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                claimed! ? "Telah diambil" : "Ambil",
                style:
                    claimed! ? disable400.copyWith() : secondary400.copyWith(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
