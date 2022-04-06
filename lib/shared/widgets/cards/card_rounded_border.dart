import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class CardRoundedBorder extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final List<BoxShadow>? shadow;

  const CardRoundedBorder({
    Key? key,
    required this.child,
    this.borderColor,
    this.borderWidth,
    this.color,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        height: height ?? Get.height,
        width: width ?? Get.width,
        padding: padding ??
            EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.med),
        decoration: BoxDecoration(
            color: color ?? AppColor.whiteColor,
            boxShadow: shadow,
            borderRadius: borderRadius != null
                ? BorderRadius.all(Radius.circular(borderRadius!))
                : Corners.lgBorder,
            border: Border.all(
                width: borderWidth ?? Strokes.thin,
                color: borderColor ?? AppColor.bodyColor.shade300)),
        child: child);
  }
}
