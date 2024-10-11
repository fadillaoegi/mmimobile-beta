import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizeScreen.height,
        width: sizeScreen.width,
        color: ColorApps.primary2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 220.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
