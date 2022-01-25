import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class CardRounded extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? width;
  final Color? color;
  final List<BoxShadow>? shadow;

  const CardRounded({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.borderRadius,
    this.color,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin ?? EdgeInsets.symmetric(horizontal: Insets.xs),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius != null
            ? BorderRadius.all(Radius.circular(borderRadius!))
            : Corners.lgBorder,
        boxShadow: shadow ?? Shadows.small,
      ),
      padding: padding ?? EdgeInsets.all(Insets.med),
      child: child,
    );
  }
}
