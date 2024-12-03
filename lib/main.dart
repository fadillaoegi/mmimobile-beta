import 'package:flutter/material.dart';
import 'package:mmimobile/configs/provider_config.dart';
import 'package:mmimobile/configs/theme_config.dart';
import 'package:mmimobile/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        theme: ThemeConfig.themeData(),
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
      ),
    );
  }
}
