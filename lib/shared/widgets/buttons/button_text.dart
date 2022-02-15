import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonText extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double? fontSize;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? icon;

  const ButtonText({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize,
    this.color,
    this.textStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon ?? const SizedBox(),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: color ?? AppColor.secondColor.shade500,
      ),
      label: Text(
        label,
        style: textStyle ?? TextStyles.button,
      ),
    );
  }
}
