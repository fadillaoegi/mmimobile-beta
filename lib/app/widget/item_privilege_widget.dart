import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mmimobile/app/widget/loading_widget.dart';

class ItemPrivilege extends StatelessWidget {
  const ItemPrivilege({
    super.key,
    this.privilagenName = "",
    this.privilagecount = "",
    this.pointPrice = 0,
    this.claimed = false,
    this.image = "",
    this.btnClaim = true,
    this.onTap,
  });

  final String privilagenName;
  final String privilagecount;
  final String image;
  final int pointPrice;
  final bool claimed;
  final bool btnClaim;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    color: privilagecount.isNotEmpty
                        ? ColorApps.primary
                        : Colors.transparent,
                    child: privilagecount.isNotEmpty
                        ? Center(
                            child: Text(
                              privilagecount,
                              style: secondary700.copyWith(fontSize: 20.0),
                            ),
                          )
                        : image.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const Center(child: LoadingApps()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AssetConfigFLdev.logo,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                AssetConfigFLdev.logo,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        privilagenName,
                        style: claimed
                            ? disable500.copyWith(fontSize: 12.0)
                            : black500.copyWith(fontSize: 14.0),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          btnClaim
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 14.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            claimed ? ColorApps.disable : ColorApps.secondary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      claimed ? "Telah diambil" : "Ambil",
                      style: claimed
                          ? disable400.copyWith()
                          : secondary400.copyWith(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
