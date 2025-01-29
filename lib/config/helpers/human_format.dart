import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
        decimalDigits: 0, symbol: '', locale: 'en_US');
    return formattedNumber.format(number);
  }
}
