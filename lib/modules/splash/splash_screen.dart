import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  String _message = "Loading...";
  final bool _isUser = false;
  Future<void> _startSplash() async {
    Timer(
      const Duration(seconds: 3),
      () {
        setState(() {
          _message;
        });
        Timer(
          const Duration(seconds: 3),
          () {
            setState(() {
              _message = "Checking user session...";
            });

            Timer(
              const Duration(seconds: 3),
              () {
                if (_isUser) {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteScreen.app,
                  );
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteScreen.signIn,
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: sizeScreen.height,
        width: sizeScreen.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetConfig.logo3,
              height: 60.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CupertinoActivityIndicator(
                  color: ColorApps.primary,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  _message,
                  style: primary500.copyWith(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
