import 'package:flutter/material.dart';
import 'package:mmimobile/configs/theme_config.dart';
import 'package:mmimobile/modules/auth/forgot_password/providers/forgot_pass_provider.dart';
import 'package:mmimobile/modules/auth/forgot_password/providers/otp_forgot_provider.dart';
import 'package:mmimobile/modules/auth/sign_in/providers/sign_in_provider.dart';
import 'package:mmimobile/modules/faq/providers/faq_provider.dart';
import 'package:mmimobile/modules/home/providers/home_provider.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPassProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpForgotProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaqProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeConfig.themeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteScreen.signIn,
        routes: RouteScreen.listRouteScreen,
      ),
    );
  }
}
