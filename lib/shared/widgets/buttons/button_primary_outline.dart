import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonPrimaryOutline extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double? width;
  final Color? color;
  final Color? outlineColor;
  final double? elevation;
  final String? icon;
  final TextStyle? labelStyle;
  final Color? iconColor;
  final double? height;
  final bool enable;

  const ButtonPrimaryOutline({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.color,
    this.outlineColor,
    this.elevation,
    this.icon,
    this.labelStyle,
    this.iconColor,
    this.height,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? IconSizes.xxl - 4,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: elevation ?? 1,
          primary: color ?? AppColor.bodyColor.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: Corners.xxlBorder * 2,
            side: BorderSide(
                color: enable
                    ? outlineColor ?? Theme.of(context).primaryColor
                    : AppColor.bodyColor.shade300,
                width: Strokes.thin),
          ),
        ),
        child: Container(
          color: AppColor.whiteColor,
          height: height ?? Sizes.med * 2,
          width: width ?? double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: Insets.med),
                      child: Image.asset(
                        icon!,
                        width: IconSizes.med,
                        color: iconColor ?? Theme.of(context).primaryColor,
                      ),
                    )
                  : horizontalSpace(0),
              Text(
                label.toUpperCase(),
                style: labelStyle ??
                    TextStyles.button.copyWith(
                        color: enable
                            ? Theme.of(context).primaryColor
                            : AppColor.bodyColor.shade300),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
