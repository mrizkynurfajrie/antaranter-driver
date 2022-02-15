import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonCategory extends StatelessWidget {
  const ButtonCategory({
    Key? key,
    this.isSelected = false,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Insets.xs),
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: Insets.sm, vertical: Insets.xs),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: Corners.lgBorder,
              border: Border.all(
                color: isSelected
                    ? AppColor.secondColor.shade400
                    : AppColor.bodyColor.shade400,
              )),
          child: Center(
              child: Text(
            title.toUpperCase(),
            style: TextStyles.small1.copyWith(
              color: isSelected
                  ? AppColor.secondColor.shade400
                  : AppColor.bodyColor.shade400,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
