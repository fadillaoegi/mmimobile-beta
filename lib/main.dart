import 'package:flutter/material.dart';
import 'package:mmimobile/routes/routes.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: RouteScreen.splash,
      routes: RouteScreen.listRouteScreen,
    );
  }
}
