import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
              width: sizeScreen.width,
              padding: const EdgeInsets.all(8.0),
              height: sizeScreen.height / 2.2,
              decoration: const BoxDecoration(
                  color: ColorApps.primary,
                  image: DecorationImage(
                      image: AssetImage(AssetConfig.imageProduct),
                      fit: BoxFit.cover)),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                            color: ColorApps.primary),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorApps.white,
                            size: 26.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: sizeScreen.height / 2.6),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              width: sizeScreen.width,
              height: sizeScreen.height,
              decoration: const BoxDecoration(
                  color: ColorApps.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Optimaze Shine By Antika",
                      style: primary600.copyWith(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Rp.50.000 /pcs",
                      style: black500.copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Netto kemasan 20 ml",
                      style: disable2400.copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Description",
                      style: black600.copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: black400.copyWith(fontSize: 13.0),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: black400.copyWith(fontSize: 13.0),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: black400.copyWith(fontSize: 13.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
