import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class ItemResi extends StatelessWidget {
  final String title;
  final String subtitle;

  const ItemResi({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyles.small2
                  .copyWith(color: AppColor.bodyColor.shade600)),
          verticalSpace(Insets.xs),
          Text(
            subtitle,
            style: TextStyles.small1,
          ),
          verticalSpace(Insets.lg),
        ],
      ),
    );
  }
}
