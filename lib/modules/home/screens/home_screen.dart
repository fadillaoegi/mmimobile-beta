import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';
import 'package:mmimobile/widget/banner_information_widget.dart';
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
                      opacity: 1,
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
                      opacity: 1,
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
