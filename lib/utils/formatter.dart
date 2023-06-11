import 'package:intl/intl.dart';

class Formatter {
  static String idrMoneyFormat({required int value, String? pattern}) {
    NumberFormat currencyFormat = NumberFormat.currency(
      decimalDigits: 0,
      symbol: pattern ?? '',
      locale: "id",
    );

    return currencyFormat.format(value);
  }
}
