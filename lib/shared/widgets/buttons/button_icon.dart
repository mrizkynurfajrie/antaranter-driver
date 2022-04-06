import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class CustomIconButton extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final EdgeInsets? iconPadding;

  const CustomIconButton({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    this.iconColor,
    this.iconWidth,
    this.iconHeight,
    this.iconPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: iconPadding,
              child: SvgPicture.asset(
                icon,
                color: iconColor,
                height: iconHeight,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border.all(color: AppColor.whiteColor),
                borderRadius: BorderRadius.circular(39),
              ),
              child: Text(
                title,
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s12,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
