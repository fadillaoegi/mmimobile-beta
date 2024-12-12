import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/styles/shadow.dart';
import 'package:mmimobile/widget/image_circle_widget.dart';
import 'package:mmimobile/widget/transparant_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        height: sizeScreen.height,
        width: sizeScreen.width,
        child: Stack(
          children: [
            Container(
              height: sizeScreen.height / 2.5,
              width: sizeScreen.width,
              decoration: const BoxDecoration(
                  color: ColorApps.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  )),
            ),
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // NOTE: SECTION 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ImageCircle(
                              size: 40.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nabila Alifah",
                                  style: white600.copyWith(fontSize: 14.0),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Diamond",
                                      style: white300.copyWith(fontSize: 12.0),
                                    ),
                                    Text(
                                      "*",
                                      style: white300.copyWith(fontSize: 12.0),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "200",
                                      style: white300.copyWith(fontSize: 12.0),
                                    ),
                                    Text(
                                      "Point",
                                      style: white300.copyWith(fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_none_sharp,
                              color: ColorApps.white,
                              size: 30.0,
                            ))
                      ],
                    ),

                    SizedBox(
                      height: sizeScreen.height / 30,
                    ),
                    // NOTE:
                    TransparantCard(
                      width: sizeScreen.width,
                      opacity: 0.7,
                      childern: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: primary500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: primary500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: primary500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: sizeScreen.height / 30,
                    ),

                    // NOTE:
                    TransparantCard(
                      width: sizeScreen.width,
                      opacity: 0.8,
                      childern: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: black500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: black500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Infromasi",
                              style: black500,
                            ),
                            const SizedBox(
                              height: 60.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BannerInformation(sizeScreen: sizeScreen),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BannerInformation(sizeScreen: sizeScreen),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

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
          color: ColorApps.primary.withOpacity(0.4),
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
