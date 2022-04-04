import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.label,
    this.size,
    this.color,
    this.labelStyle,
    this.height,
    this.margin,
    this.enable = true,
    this.icon,
    this.iconColor,
    this.cornerRadius,
    this.borderColor
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final bool enable;
  final double? height;
  final String? icon;
  final Color? iconColor;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsets? margin;
  final double? size;
  final double? cornerRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        height: height ?? IconSizes.xxl - 6,
        width: size ?? double.infinity,
        child: ElevatedButton(
            onPressed: enable ? onPressed : null,
            style: ElevatedButton.styleFrom(
              primary: enable
                  ? color ?? Theme.of(context).primaryColor
                  : AppColor.bodyColor.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: cornerRadius != null
                    ? BorderRadius.all(Radius.circular(cornerRadius!))
                    : Corners.xxlBorder * 2,
              side: BorderSide(color: borderColor ?? AppColor.transparentColor)
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: Insets.med),
                        child: Image.asset(
                          icon!,
                          width: IconSizes.lg,
                          color: iconColor ?? null,
                        ),
                      )
                    : horizontalSpace(0),
                Text(
                  label,
                  style: labelStyle ??
                      TextStyles.textBaseBold
                          .copyWith(color: AppColor.whiteColor),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
