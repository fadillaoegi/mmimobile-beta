import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/styles/fonts.dart';

class UnderdevelopmentScreen extends StatelessWidget {
  const UnderdevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetConfig.underdevMmi,
              height: 200.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Sorry, this feature is\nunder development",
              style: black500.copyWith(fontSize: 20.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
