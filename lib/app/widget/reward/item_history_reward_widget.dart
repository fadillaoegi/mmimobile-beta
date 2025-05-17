import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class ItemHistoryReward extends StatelessWidget {
  const ItemHistoryReward({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetConfigFLdev.iconCoinNew,
                    height: 40.0,
                    width: 40.0,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hadiah harian",
                        style: secondary600.copyWith(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "Poin cek-in harian",
                        style: secondary300.copyWith(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "18-02-2025 15:54",
                        style: secondary300.copyWith(fontSize: 14.0),
                      )
                    ],
                  )
                ],
              ),
              Text(
                "10 +",
                style: secondary300.copyWith(fontSize: 18.0),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Divider(
            color: ColorApps.disable,
          )
        ],
      ),
    );
  }
}
