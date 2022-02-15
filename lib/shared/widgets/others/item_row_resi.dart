import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ItemRowResi extends StatelessWidget {
  const ItemRowResi(
      {Key? key,
      required this.s1,
      required this.s2,
      this.isBold1 = false,
      this.isBold2 = false})
      : super(key: key);
  final String s1;
  final String s2;
  final bool isBold1;
  final bool isBold2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          s1,
          style: TextStyles.small1.copyWith(
              fontWeight: isBold1 ? FontWeight.bold : FontWeight.normal),
        )),
        Expanded(
            child: Text(
          s2,
          style: TextStyles.small1.copyWith(
              fontWeight: isBold2 ? FontWeight.bold : FontWeight.normal),
          textAlign: TextAlign.end,
        )),
      ],
    );
  }
}
