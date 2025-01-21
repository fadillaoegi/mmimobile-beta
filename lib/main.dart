import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmimobile/app/configs/session_config.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // NOTE: Ambil data sesi pengguna sebelum menjalankan aplikasi
  User? currentUser = await SessionUser.getUser();

  runApp(
    GetMaterialApp(
      title: "Mmimobile",
      debugShowCheckedModeBanner: false,
      initialRoute: currentUser != null && currentUser.customerId != null
          ? AppPages.mainApp
          : AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeConfig.themeData(),
    ),
  );
}
