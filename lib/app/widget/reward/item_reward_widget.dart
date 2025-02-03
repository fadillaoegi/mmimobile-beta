import 'package:flutter/widgets.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';

class ItemDailyReward extends StatelessWidget {
  const ItemDailyReward({
    super.key,
    this.point = 2,
    this.isChacked = true,
  });

  final int? point;
  final bool? isChacked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(28, 109, 133, 36),
          border: Border.all(
              color: isChacked!
                  ? ColorApps.primary
                  : const Color.fromARGB(100, 175, 175, 175)),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "+$point",
            style: primary500.copyWith(fontSize: 12.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Image.asset(
            AssetConfigFLdev.iconPoint,
            height: 22.0,
            width: 22.0,
          ),
        ],
      ),
    );
  }
}
