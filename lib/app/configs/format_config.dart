import 'package:intl/intl.dart';

class FormatAppsFLdev {
  // Format tanggal lengkap (dd MMMM yyyy)
  static String dateFull(String strDate) {
    try {
      DateTime dateTime = DateTime.parse(strDate);
      return DateFormat("dd MMMM yyyy", "id_ID").format(dateTime);
    } catch (e) {
      // Return string kosong jika parsing gagal
      return "";
    }
  }

  // Format tanggal singkat (d MM)
  static String dateMonth(String strDate) {
    try {
      DateTime dateTime = DateTime.parse(strDate);
      return DateFormat("d MM", "id_ID").format(dateTime);
    } catch (e) {
      // Return string kosong jika parsing gagal
      return "";
    }
  }

  static String currencyShort(String value) {
    try {
      double amount = double.parse(value);

      if (amount >= 1000000000000) {
        // 1 Triliun ke atas
        double result = amount / 1000000000000;
        return "Rp.${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)} T";
      } else if (amount >= 1000000000) {
        // 1 Miliar ke atas
        double result = amount / 1000000000;
        return "Rp.${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)} M";
      } else if (amount >= 1000000) {
        // 1 Juta ke atas
        double result = amount / 1000000;
        return "Rp.${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)} jt";
      } else if (amount >= 1000) {
        // 1 Ribu ke atas
        double result = amount / 1000;
        return "Rp.${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)} Rb";
      } else {
        // Di bawah 1 ribu, tampil full format
        return NumberFormat.currency(
          locale: "id_ID",
          decimalDigits: 0,
          symbol: "Rp.",
        ).format(amount);
      }
    } catch (e) {
      return "Rp.0";
    }
  }

  // Format currency dengan simbol "Rp."
  static String currency(String value) {
    try {
      double amount = double.parse(value);
      return NumberFormat.currency(
        locale: "id_ID",
        decimalDigits: 2,
        symbol: "Rp. ",
      ).format(amount);
    } catch (e) {
      // Return default "Rp. 0.00" jika parsing gagal
      return "Rp. 0.00";
    }
  }

  // Format poin tanpa simbol dan tanpa angka di belakang koma
  static String point(String value) {
    try {
      double amount = double.parse(value);
      return NumberFormat("#,##0", "id_ID").format(amount); // Hanya angka bulat
    } catch (e) {
      return "0"; // Jika parsing gagal, kembalikan "0"
    }
  }
}
