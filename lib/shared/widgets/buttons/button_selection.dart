import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonSelection extends StatelessWidget {
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
  final bool isCapital;

  const ButtonSelection({
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
    this.isCapital = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Sizes.med * 2,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          primary: color ?? AppColor.bodyColor.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: Corners.lgBorder,
            side: BorderSide(
                color: enable
                    ? outlineColor ?? AppColor.bodyColor.shade300
                    : AppColor.bodyColor.shade300,
                width: Strokes.thin),
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
                      width: IconSizes.med,
                      color: iconColor ?? Theme.of(context).primaryColor,
                    ),
                  )
                : horizontalSpace(0),
            Text(
              isCapital ? label.toUpperCase() : label,
              style: labelStyle ??
                  TextStyles.small1.copyWith(
                      color: enable
                          ? AppColor.bodyColor
                          : AppColor.bodyColor.shade300),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down,
              size: IconSizes.med,
              color: AppColor.bodyColor.shade600,
            )
          ],
        ),
      ),
    );
  }
}
