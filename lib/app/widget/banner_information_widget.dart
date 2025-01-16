import 'package:flutter/material.dart';
import 'package:mmimobile/app/configs/asset_config.dart';
import 'package:mmimobile/app/styles/color.dart';
import 'package:mmimobile/app/styles/fonts.dart';
import 'package:mmimobile/app/styles/shadow.dart';
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
      height: sizeScreen.height / 2.8,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: ColorApps.primary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Promotion this month",
                style: white400.copyWith(fontSize: 18.0),
              ),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
                color: ColorApps.white,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                7,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TransparantCard(
                    width: sizeScreen.width / 1.3,
                    padding: 0.0,
                    height: 200.0,
                    childern: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: sizeScreen.width / 1.3,
                            height: 200.0,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                // borderRadius: BorderRadius.only(
                                //     topLeft:
                                //         Radius.circular(10.0),
                                //     topRight:
                                //         Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: AssetImage(AssetConfig.examplePromo),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ),
                    ],
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
