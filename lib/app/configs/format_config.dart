import 'package:intl/intl.dart';

class FormatAppsFLdev {
  static String dateFull(String strdate) {
    DateTime dateTime = DateTime.parse(strdate);
    return DateFormat("dd MM yy", "id_ID").format(dateTime);
  }

  static String dateMonth(String strDate) {
    DateTime dateTime = DateTime.parse(strDate);
    return DateFormat("d MM", "id_ID").format(dateTime);
  }

  static String currency(String value) {
    return NumberFormat.currency(
            locale: "id_ID", decimalDigits: 2, symbol: "Rp.")
        .format(double.parse(value));
  }
}
