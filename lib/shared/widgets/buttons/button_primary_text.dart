import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonPrimaryText extends StatelessWidget {
  const ButtonPrimaryText({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.description,
    this.size,
    this.color,
    this.labelStyle,
    this.descriptionStyle,
    this.height,
    this.margin,
    this.enable = true,
    this.icon,
    this.iconColor,
    this.cornerRadius,
  }) : super(key: key);

  final Function() onPressed;
  final Color? color;
  final bool enable;
  final double? height;
  final String? icon;
  final Color? iconColor;
  final String label;
  final TextStyle? labelStyle;
  final String description;
  final TextStyle? descriptionStyle;

  final EdgeInsets? margin;
  final double? size;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        height: height ?? IconSizes.xxl - 4,
        width: size ?? double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: enable
                  ? color ?? Theme.of(context).primaryColor
                  : AppColor.bodyColor.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: cornerRadius != null
                    ? BorderRadius.all(Radius.circular(cornerRadius!))
                    : Corners.xxlBorder * 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Padding(
                            padding: EdgeInsets.only(right: Insets.med),
                            child: Image.asset(
                              icon!,
                              width: IconSizes.med,
                              color:
                                  iconColor ?? Theme.of(context).primaryColor,
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
                ),
                Text(
                  description,
                  style: descriptionStyle ??
                      TextStyles.textBaseBold
                          .copyWith(color: AppColor.whiteColor),
                  textAlign: TextAlign.center,
                ),
              ],
            )));
  }
}
