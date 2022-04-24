import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:flutter/material.dart';

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String imageUrlPath(String fileName) {
  return "${Api1().imgStorUrl}$fileName";
}