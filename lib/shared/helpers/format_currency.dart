import 'package:intl/intl.dart';

String priceFormat(dynamic price, {bool space = false}) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: space ? 'Rp ' : 'Rp',
    decimalDigits: 0,
  ).format(price);
}

String priceFormatWithoutSymbol(dynamic price) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  ).format(price);
}

String priceFormatCompact(dynamic price) {
  return NumberFormat.compactCurrency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  ).format(price);
}

countTotal(String v1, String v2) {
  double a = double.parse(v1);
  double b = double.parse(v2);

  return a + b;
}

// int getReedemValue({required int amount}) {
//   final ControllerUserInfo cUser = Get.find();
//   int point = cUser.posPayPoint.value.toInt();
//   if (amount > point) {
//     return point;
//   } else {
//     return amount;
//   }
// }
