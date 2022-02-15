import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonIconVertical extends StatelessWidget {
  final String icon;
  final String text;
  final double? width;
  final double? iconSize;
  final TextStyle? textStyle;
  final Function() onTap;

  const ButtonIconVertical({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textStyle,
    this.iconSize,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          padding: EdgeInsets.all(Insets.sm),
          iconSize: iconSize ?? IconSizes.xl,
          onPressed: onTap,
          icon: Image.asset(
            icon,
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          width: width ?? IconSizes.xxl,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle ?? TextStyles.small2,
          ),
        )
      ],
    );
  }
}
