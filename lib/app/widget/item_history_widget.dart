import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/configs/format_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';

class ItemHistory extends StatelessWidget {
  const ItemHistory({
    super.key,
    this.onTap,
    this.idSo = "",
    this.brandName = "",
    this.productName = "",
    this.date = "",
    this.shadow = true,
    this.productCount = 0,
    this.count = 0,
    this.isDetail = false,
    this.qty = 0,
    this.priceProduct = 0,
    this.isLoading = false,
  });

  final VoidCallback? onTap;
  final bool shadow;
  final bool isDetail;
  final String idSo;
  final String productName;
  final String date;
  final String brandName;
  final int priceProduct;
  final int qty;
  final int count;
  final int productCount;
  final bool isLoading; // Tambahkan isLoading

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sizeScreen.width,
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          // border: Border.all(color: const Color(0x7077bba2)),
          boxShadow: boxShadow,
          color: ColorApps.cardTransparan,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorApps.primary, // Warna loading
                ),
              )
            : Row(
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                            AssetConfigFLdev.logo), // Pastikan asset benar
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // if (idSo.isNotEmpty)
                        //   contentItem(nameSO, black600, 14.0),
                        if (productName.isNotEmpty)
                          contentItem(productName, black600, 14.0),
                        if (brandName.isNotEmpty)
                          contentItem(brandName, black400, 12.0),
                        if (date.isNotEmpty) contentItem(date, black400, 12.0),
                        if (priceProduct != 0)
                          contentItem(
                              "${FormatAppsFLdev.currency(priceProduct.toString())} /pcs",
                              black400,
                              12.0),
                        if (productCount != 0)
                          contentItem(
                              "x $productCount Product", black400, 12.0),
                        if (qty != 0) contentItem("x $qty Pcs", black400, 12.0),
                        if (count != 0)
                          contentItem(
                              "${FormatAppsFLdev.currency(count.toString())}",
                              secondary500,
                              12.0),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget contentItem(String text, TextStyle style, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: style.copyWith(fontSize: fontSize),
        softWrap: true, // Agar teks tidak terpotong
        overflow:
            TextOverflow.visible, // Pastikan teks turun ke bawah jika panjang
      ),
    );
  }
}
