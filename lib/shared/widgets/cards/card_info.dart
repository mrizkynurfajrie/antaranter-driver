import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class CardInfo extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String info;
  final EdgeInsets? margin;
  final bool textOnly;
  final bool showIcon;
  final Widget? child;
  const CardInfo({
    Key? key,
    this.color,
    required this.info,
    this.textColor,
    this.margin,
    this.textOnly = true,
    this.showIcon = true,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding: EdgeInsets.all(Insets.med),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor.withOpacity(.1),
        borderRadius: Corners.lgBorder,
      ),
      child: Row(
        children: [
          showIcon
              ? Icon(
                  Icons.info,
                  size: IconSizes.xl,
                  color: color ?? Theme.of(context).primaryColor,
                )
              : horizontalSpace(0),
          horizontalSpace(Insets.med),
          Expanded(
            child: textOnly
                ? Text(
                    info,
                    style: TextStyles.small1.copyWith(
                      color: textColor ??
                          Theme.of(context).primaryColor.withOpacity(.7),
                    ),
                  )
                : child ?? horizontalSpace(0),
          )
        ],
      ),
    );
  }
}
