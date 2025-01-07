import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mmimobile/routes/initial_routes.dart';
import 'package:mmimobile/routes/routes.dart';

class SplashProvider extends ChangeNotifier {
  String message = "Loading...";
  final bool _isUser = false;

  Future<void> startSplash() async {
    Timer(
      const Duration(seconds: 3),
      () {
        // setState(() {
        message;
        // });
        notifyListeners();
        Timer(
          const Duration(seconds: 3),
          () {
            // setState(() {
            message = "Checking user session...";
            // });
            notifyListeners();

            Timer(
              const Duration(seconds: 3),
              () {
                if (_isUser) {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   RouteScreen.app,
                  // );
                  goRouter.goNamed(RouteScreen.app);
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
}
