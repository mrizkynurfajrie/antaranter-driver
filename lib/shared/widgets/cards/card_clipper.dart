import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class CardClipper extends StatelessWidget {
  const CardClipper(
      {Key? key,
      required this.child,
      required this.clipper,
      this.isMasking = true})
      : super(key: key);
  final Widget child;
  final CustomClipper<Path> clipper;
  final bool isMasking;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: clipper,
        child: Container(
          width: Get.width,
          padding:
              EdgeInsets.symmetric(vertical: Insets.xxl, horizontal: Insets.lg),
          decoration: isMasking
              ? BoxDecoration(
                  borderRadius: Corners.lgBorder,
                  color: AppColor.whiteColor,
                  image: const DecorationImage(
                      image: AssetImage(AppImages.resiMask), fit: BoxFit.cover),
                )
              : BoxDecoration(
                  borderRadius: Corners.lgBorder,
                  color: AppColor.whiteColor,
                ),
          child: child,
        ));
  }
}
