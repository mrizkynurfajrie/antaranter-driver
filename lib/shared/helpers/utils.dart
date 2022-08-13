import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

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

// Compress image
Future<File> compressImage(XFile file) async {
  final name = file.name;
  // Create output file path
  var extension = path.extension(name); // '.png'
  final dir = await path_provider.getTemporaryDirectory();
  final outPath = "${dir.absolute.path}/_out$name";
  late CompressFormat compressFormat;
  switch (extension) {
    case '.jpg':
      compressFormat = CompressFormat.jpeg;
      break;
    case '.jpeg':
      compressFormat = CompressFormat.jpeg;
      break;
    case '.png':
      compressFormat = CompressFormat.png;
      break;
    case '.heic':
      compressFormat = CompressFormat.heic;
      break;
    case '.webp':
      compressFormat = CompressFormat.webp;
      break;
    default:
      extension = '.png';
      compressFormat = CompressFormat.png;
  }
  var result = await FlutterImageCompress.compressAndGetFile(
    file.path,
    outPath,
    quality: 50,
    format: compressFormat,
  );
  // print(await file.length());
  // print(result?.lengthSync());
  return result!;
}

