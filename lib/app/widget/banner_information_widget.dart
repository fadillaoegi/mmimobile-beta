import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/widget/transparant_card_widget.dart';

class BannerInformation extends StatelessWidget {
  const BannerInformation({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;
  // final double? height;
  // final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeScreen.width,
      height: sizeScreen.height / 2.5,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: ColorApps.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Sorotan bulan ini",
                style: secondary600.copyWith(fontSize: 16.0),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: ColorApps.secondary,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  7,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: CardFLdev(
                      width: sizeScreen.width / 1.3,
                      padding: 0.0,
                      height: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: sizeScreen.width / 1.3,
                            height: 200.0,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        AssetConfigFLdev.examplePromo),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
