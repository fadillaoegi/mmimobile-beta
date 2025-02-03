import 'package:flutter/material.dart';
import 'package:mmimobile/app/styles/color.dart';

List<BoxShadow>? boxShadow = [
  BoxShadow(
    color: ColorApps.black.withValues(alpha: 0.12), // Warna bayangan
    spreadRadius: 0, // Seberapa jauh shadow menyebar
    blurRadius: 7, // Seberapa halus blur shadow
    offset: const Offset(0, 6), // Offset shadow (X, Y)
  )
];
