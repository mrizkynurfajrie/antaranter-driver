import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class CustomIconButton extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;

  const CustomIconButton({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.iconWidth,
    required this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.bodyColor,
            border: Border.all(
              color: AppColor.greyColorLight,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 32,
                height: 32,
                child: SvgPicture.asset(
                  icon,
                  color: iconColor,
                  height: iconHeight,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                title,
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
