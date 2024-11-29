import 'package:flutter/material.dart';
import 'package:mmimobile/styles/color.dart';

List<BoxShadow>? boxShadow = [
  BoxShadow(
    color: ColorApps.black.withOpacity(0.10), // Warna bayangan
    spreadRadius: 0, // Seberapa jauh shadow menyebar
    blurRadius: 7, // Seberapa halus blur shadow
    offset: const Offset(0, 5), // Offset shadow (X, Y)
  )
];
