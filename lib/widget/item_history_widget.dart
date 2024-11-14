import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({
    super.key,
    this.onTap,
    this.nameSO = "",
    this.date = "",
    this.shadow = true,
    this.productCount = 0,
    this.count = "",
  });

  final VoidCallback? onTap;
  final bool? shadow;
  final String? nameSO;
  final String? count;
  final int? productCount;
  final String? date;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: sizeScreen.width,
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
            border: shadow!
                ? Border.all(color: ColorApps.white)
                : Border.all(color: ColorApps.disable),
            boxShadow: [
              shadow!
                  ? BoxShadow(
                      color:
                          ColorApps.black.withOpacity(0.10), // Warna bayangan
                      spreadRadius: 0, // Seberapa jauh shadow menyebar
                      blurRadius: 0.6, // Seberapa halus blur shadow
                      offset: const Offset(0, 5), // Offset shadow (X, Y)
                    )
                  : const BoxShadow(),
            ],
            color: ColorApps.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            Container(
              height: 60.0,
              width: 60.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetConfig.logo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$nameSO",
                  style: black600.copyWith(fontSize: 14.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "x$productCount Product",
                  style: disable400.copyWith(fontSize: 12.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "$date",
                  style: disable400.copyWith(fontSize: 12.0),
                ),
                count == ""
                    ? const SizedBox()
                    : const SizedBox(
                        height: 8.0,
                      ),
                count == ""
                    ? const SizedBox()
                    : Text(
                        "Total $count",
                        style: primary500.copyWith(fontSize: 12.0),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
