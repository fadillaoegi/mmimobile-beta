import 'dart:math';
import 'dart:ui';
import 'package:mmimobile/app/styles/color.dart';

class HelperFldev {
  static String newParagraphText(String text, int maxLength) {
    List<String> chunks = [];
    for (int i = 0; i < text.length; i += maxLength) {
      chunks.add(text.substring(i, min(i + maxLength, text.length)));
    }
    return chunks.join("\n");
  }

  static String maskText(String text) {
    if (text.length <= 4) {
      return text;
    }
    String visiblePart = text.substring(0, 4);
    String maskedPart = ''.padRight(text.length - 4, '*');
    return '$visiblePart$maskedPart';
  }

  static String dotOverflowText(String text, {int maxLength = 16}) {
    return (text.length > maxLength)
        ? '${text.substring(0, maxLength)}...'
        : text;
  }

  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text; // Jika teks kosong, langsung return
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static Color safeHexToColor(String hex,
      {Color fallback = ColorApps.secondary}) {
    try {
      hex = hex.replaceAll("#", "").toUpperCase();
      // Validasi hanya karakter 0-9 dan A-F
      final validHex = RegExp(r'^[0-9A-F]{6}$');
      if (!validHex.hasMatch(hex)) return fallback;
      return Color(int.parse("0xFF$hex"));
    } catch (_) {
      return fallback;
    }
  }
}
