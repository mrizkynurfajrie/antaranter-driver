import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class CustomIconButton extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;

  const CustomIconButton({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(65),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: 65,
                  height: 65,
                  color: AppColor.bodyColor.shade200,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              verticalSpace(5),
              Text(
                title,
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w600,
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
