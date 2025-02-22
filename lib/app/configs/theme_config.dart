import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmimobile/app/styles/color.dart';

class ThemeConfigFLdev {
  static themeData() {
    return ThemeData(
      scaffoldBackgroundColor: ColorApps.bg,
      textTheme: GoogleFonts.poppinsTextTheme(),
      indicatorColor: ColorApps.secondary,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: ColorApps.secondary),
          backgroundColor: ColorApps.bg),
    );
  }
}
