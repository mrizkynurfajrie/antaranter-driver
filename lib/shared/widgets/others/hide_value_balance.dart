import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class HideValueBalance extends StatelessWidget {
  const HideValueBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
        horizontalSpace(Insets.sm / 2),
        Icon(Icons.circle,
            color: Theme.of(context).primaryColor, size: IconSizes.sm / 2),
      ],
    );
  }
}
