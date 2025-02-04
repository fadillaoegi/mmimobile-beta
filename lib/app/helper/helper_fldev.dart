import 'dart:math';

class HelperFldev {
  static String formatText(String text, int maxLength) {
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
}
