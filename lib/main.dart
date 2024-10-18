import 'package:flutter/material.dart';
import 'package:mmimobile/modules/auth/forgot_password/providers/forgot_pass_provider.dart';
import 'package:mmimobile/modules/home/providers/home_provider.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/styles/color.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPassProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: ColorApps.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteScreen.splash,
        routes: RouteScreen.listRouteScreen,
      ),
    );
  }
}
