import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';

class CardRoundedClickable extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? width;
  final Color? color;
  final List<BoxShadow>? shadow;
  final Function()? onTap;

  const CardRoundedClickable({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.borderRadius,
    this.color,
    this.shadow,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin ?? EdgeInsets.symmetric(horizontal: Insets.xs),
      decoration: BoxDecoration(
        boxShadow: shadow ?? Shadows.small,
      ),
      child: Material(
        type: MaterialType.card,
        color: color ?? Colors.white,
        borderRadius: borderRadius != null
            ? BorderRadius.all(Radius.circular(borderRadius!))
            : Corners.lgBorder,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.all(Insets.med),
            child: child,
          ),
        ),
      ),
    );
  }
}
