import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory(
      {super.key,
      this.onTap,
      this.nameSO = "",
      this.brandName = "",
      this.productName = "",
      this.date = "",
      this.shadow = true,
      this.productCount = 0,
      this.count = 0,
      this.isDetail = false,
      this.qty = 0,
      this.priceProduct = 0});

  final VoidCallback? onTap;
  final bool? shadow;
  final bool? isDetail;
  final String? nameSO;
  final int? priceProduct;
  final int? qty;
  final int? count;
  final String? productName;
  final int? productCount;
  final String? date;
  final String? brandName;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return GestureDetector(
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
                      color: ColorApps.black
                          .withValues(alpha: 0.10), // Warna bayangan
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
                      image: AssetImage(AssetConfigFLdev.logo),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nameSO!.isNotEmpty
                    ? contentItem("$nameSO", black600, 14.0)
                    : const SizedBox(),
                productName!.isNotEmpty
                    ? contentItem("$productName", black600, 14.0)
                    : const SizedBox(),
                brandName!.isNotEmpty
                    ? contentItem("$brandName", disable2400, 12.0)
                    : const SizedBox(),
                contentItem("$date", disable2400, 12.0),
                priceProduct! != 0
                    ? contentItem(
                        "${FormatAppsFLdev.currency(priceProduct.toString())} /pcs",
                        disable2400,
                        12.0)
                    : const SizedBox(),
                productCount! != 0
                    ? contentItem("x$productCount Product", disable2400, 12.0)
                    : const SizedBox(),
                qty! != 0
                    ? contentItem("x$qty Pcs", disable2400, 12.0)
                    : const SizedBox(),
                count! != 0
                    ? contentItem(
                        "${FormatAppsFLdev.currency(count.toString())}",
                        primary500,
                        12.0)
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget contentItem(String text, TextStyle style, double fontSize) {
    return Column(
      children: [
        Text(
          "$text",
          style: style.copyWith(fontSize: 14.0),
        ),
        const SizedBox(
          height: 6.0,
        ),
      ],
    );
  }
}
