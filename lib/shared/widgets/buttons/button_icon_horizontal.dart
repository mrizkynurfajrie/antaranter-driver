import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class ButtonIconHorizontal extends StatelessWidget {
  final String icon;
  final String text;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Function() onTap;

  const ButtonIconHorizontal({
    Key? key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.height,
    this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: EdgeInsets.all(Insets.sm),
            onPressed: onTap,
            icon: Image.asset(
              icon,
              height: height ?? IconSizes.med,
              width: width ?? IconSizes.med,
              fit: BoxFit.scaleDown,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: textStyle ?? TextStyles.small2,
            ),
          )
        ],
      ),
    );
  }
}
