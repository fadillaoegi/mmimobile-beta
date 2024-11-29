import 'package:flutter/material.dart';
import 'package:mmimobile/modules/phone_edit/providers/phone_edit_provider.dart';
import 'package:provider/provider.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:mmimobile/configs/theme_config.dart';
import 'package:mmimobile/modules/faq/providers/faq_provider.dart';
import 'package:mmimobile/modules/home/providers/home_provider.dart';
import 'package:mmimobile/modules/auth/providers/sign_in_provider.dart';
import 'package:mmimobile/modules/auth/providers/forgot/otp_forgot_provider.dart';
import 'package:mmimobile/modules/auth/providers/forgot/forgot_pass_provider.dart';
import 'package:mmimobile/modules/auth/providers/forgot/reset_password_provider.dart';
import 'package:mmimobile/modules/password_edit/providers/password_edit_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

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
          create: (context) => ResetPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordEditProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneEditProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaqProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeConfig.themeData(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteScreen.splash,
        routes: RouteScreen.listRouteScreen,
      ),
    );
  }
}
