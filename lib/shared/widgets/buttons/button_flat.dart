import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class ButtonFlat extends StatelessWidget {
  const ButtonFlat(
      {Key? key,
      this.color,
      this.outlineColor,
      this.label,
      this.labelStyle,
      this.borderRadius,
      required this.onTap,
      this.isLoading = false,
      this.enable = true,
      this.height,
      this.width,
      this.textColor})
      : super(key: key);

  final Function() onTap;
  final Color? color;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final bool enable;
  final double? height;
  final bool isLoading;
  final String? label;
  final TextStyle? labelStyle;
  final Color? outlineColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? Sizes.xl,
        decoration: BoxDecoration(
            color: color ?? AppColor.whiteColor,
            border: Border.all(
              width: Strokes.xthin,
              color: outlineColor ?? Theme.of(context).primaryColor,
            ),
            borderRadius: borderRadius ?? Corners.medBorder),
        child: Center(
          child: Text(
            label ?? '',
            style: labelStyle ??
                TextStyles.textXs.copyWith(
                  color: textColor ?? Theme.of(context).primaryColor,
                ),
          ),
        ),
      ),
    );
  }
}
