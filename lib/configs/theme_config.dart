import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmimobile/styles/color.dart';

class ThemeConfig {
  static themeData() {
    return ThemeData(
        scaffoldBackgroundColor: ColorApps.white,
        textTheme: GoogleFonts.poppinsTextTheme(),
        indicatorColor: ColorApps.primary,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: ColorApps.primary),
            backgroundColor: ColorApps.white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorApps.white));
  }
}
