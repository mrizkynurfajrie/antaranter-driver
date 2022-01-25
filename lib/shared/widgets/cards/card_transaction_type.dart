import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class CardTransactionType extends StatelessWidget {
  final String? title;
  final String type;
  final String? description;
  final Widget? icon;
  const CardTransactionType({
    Key? key,
    this.title,
    required this.type,
    this.description,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.lg),
      child: Row(
        children: [
          icon ?? horizontalSpace(0),
          horizontalSpace(Insets.sm),
          Expanded(
            child: Text(
              type,
              style: TextStyles.h6,
            ),
          ),
          // Expanded(
          //   child: Text(
          //     description ?? '',
          //     style: TextStyles.body2,
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     textAlign: TextAlign.end,
          //   ),
          // ),
        ],
      ),
    );
  }
}
