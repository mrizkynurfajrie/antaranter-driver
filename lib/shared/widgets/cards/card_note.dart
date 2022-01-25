import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/cards/card_rounded_border.dart';

class CardNote extends StatelessWidget {
  final String? title;

  final String note;
  const CardNote({Key? key, this.title, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'Catatan',
          style: TextStyles.body1,
        ),
        verticalSpace(Insets.sm),
        CardRoundedBorder(
          child: Text(
            note,
            style: TextStyles.small1,
            maxLines: 5,
          ),
        ),
        verticalSpace(Insets.lg)
      ],
    );
  }
}
