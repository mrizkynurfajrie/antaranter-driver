import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

import 'button_text.dart';

class ButtonRichText extends StatelessWidget {
  final Function() onPress;
  final String description;
  final String label;
  final MainAxisAlignment? alignment;
  final TextStyle? style;
  final Color? labelColor;
  const ButtonRichText({
    Key? key,
    required this.onPress,
    required this.description,
    required this.label,
    this.alignment,
    this.style,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.xxl,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: alignment ?? MainAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyles.small1,
            ),
            ButtonText(
              onPressed: onPress,
              label: label,
              color: labelColor ?? AppColor.secondColor,
              textStyle: style ??
                  TextStyles.small1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
