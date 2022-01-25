import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/assets.dart';

class ImageCircular extends StatelessWidget {
  final String uri;
  final double? height;
  final double? width;

  const ImageCircular(
      {Key? key, required this.uri, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? 60,
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
        child: Image.memory(
          base64Decode(uri == '' ? DefaultProfile.avatar : uri),
          fit: BoxFit.cover,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
