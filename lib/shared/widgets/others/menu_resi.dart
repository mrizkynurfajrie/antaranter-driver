import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

List<Widget> menuResi(
    {required Function() share, required Function() download}) {
  return [
    InkWell(
      onTap: share,
      child: Padding(
        padding: EdgeInsets.all(Insets.med),
        child: Center(
          child: Icon(
            Icons.share,
            color: AppColor.bodyColor.shade600,
          ),
        ),
      ),
    ),
    InkWell(
      onTap: download,
      child: Padding(
        padding: EdgeInsets.all(Insets.med),
        child: Center(
          child: Icon(
            Icons.save_alt,
            color: AppColor.bodyColor.shade600,
          ),
        ),
      ),
    )
  ];
}
