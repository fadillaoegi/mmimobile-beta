import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mmimobile/app/routes/app_pages.dart';
import 'package:mmimobile/app/configs/theme_config.dart';
import 'package:mmimobile/app/session/user_session.dart';
import 'package:mmimobile/app/data/models/user_model.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("id_ID");

  // NOTE: put data session user before run apps
  User? currentUser = await SessionUserFLdev.getUser();

  runApp(
    GetMaterialApp(
      title: "Mmimobile",
      debugShowCheckedModeBanner: false,
      initialRoute: currentUser != null && currentUser.customerId != null
          ? AppPages.mainApp
          : AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeConfigFLdev.themeData(),
    ),
  );
}
