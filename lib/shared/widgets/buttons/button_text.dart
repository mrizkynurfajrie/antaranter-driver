import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonText extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double? fontSize;
  final Color? color;
  final TextStyle? textStyle;
  // final Widget? icon;

  const ButtonText({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize,
    this.color,
    this.textStyle,
    // this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // icon: icon ?? const SizedBox(),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        primary: color ?? AppColor.secondColor.shade500,
        minimumSize: const Size(50, 30),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        alignment: Alignment.center,
      ),
      child: Text(
        label,
        style: textStyle ?? TextStyles.button,
        textAlign: TextAlign.center,
      ),
    );
  }
}
