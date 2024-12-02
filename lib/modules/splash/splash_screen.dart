import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mmimobile/configs/asset_config.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:mmimobile/styles/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _message = "Loading...";
  final bool _isUser = false;
  @override
  void initState() {
    super.initState();
    _startSplash();
  }

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
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   RouteScreen.app,
                  // );
                  goRouter.goNamed(RouteScreen.signIn);
                } else {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   RouteScreen.signIn,
                  // );
                  goRouter.goNamed(RouteScreen.signIn);
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
    GoRouter goRouter = GoRouter.of(context);

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
