import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class CardPrimary extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Widget child;
  final List<BoxShadow>? shadow;
  final bool withShadow;
  final Color color;
  CardPrimary({
    required this.height,
    required this.width,
    required this.child,
    this.radius = 8,
    this.padding = EdgeInsets.zero,
    this.color = Colors.white,
    this.shadow,
    this.withShadow = false,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: Shadows.small,
      ),
      child: child,
    );
  }
}
