import 'package:flutter/material.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorApps.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteScreen.splash,
      routes: RouteScreen.listRouteScreen,
    );
  }
}
