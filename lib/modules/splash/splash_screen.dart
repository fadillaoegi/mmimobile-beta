import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 startSplash() async {
  return Timer(
    const Duration(seconds: 3),
    () {
      Navigator.pushReplacementNamed(
        context,
        RouteScreen.signIn,
      );
    },
  );
}

@override
void initState() {
  super.initState();
  startSplash();
}


  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        color: ColorApps.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetConfig.logo3,
              width: 280.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
