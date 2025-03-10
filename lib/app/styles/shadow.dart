import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';

List<BoxShadow>? boxShadow = [
  BoxShadow(
    color: ColorApps.black.withValues(alpha: 0.10), // Warna bayangan
    // color: ColorApps.white, // Warna bayangan
    spreadRadius: 0, // Seberapa jauh shadow menyebar
    blurRadius: 0.6, // Seberapa halus blur shadow
    offset: const Offset(0, 5), // Offset shadow (X, Y)
  ),
];
