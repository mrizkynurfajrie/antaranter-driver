// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyPtBrFormatter extends TextInputFormatter {
  CurrencyPtBrFormatter({required this.maxDigits});
  final int maxDigits;
  dynamic _uMaskValue;
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (maxDigits != null && newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }
    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,###");
    String newText = "Rp. " + formatter.format(value);
    _uMaskValue = value / 100;
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  dynamic getUnmaskedDouble() {
    return _uMaskValue;
  }
}

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
