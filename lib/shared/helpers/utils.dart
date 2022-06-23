import 'dart:convert';

import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:flutter/material.dart';

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String imageUrlPath(String fileName) {
  return "${Api1().imgStorUrl}$fileName";
}

String errorMessage(String data) {
  var error = data.toString().substring(0, data.toString().indexOf(':'));
  try {
    error = data.toString().replaceAll("$error:", "");
    var message = jsonDecode(error)['errors'][0]['message']['message'];
    if (message != null) {
      return message.toString();
    }
  } catch (e) {
    return data;
  }
  return data;
}
