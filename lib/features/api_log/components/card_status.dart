
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';

class CardStatus extends StatelessWidget {
  final String status;
  const CardStatus({Key? key, required this.status}) : super(key: key);

  Color getMethodColor(String method) {
    if (method.toLowerCase().contains('get')) {
      return Colors.green.withOpacity(.3);
    } else if (method.toLowerCase().contains('post')) {
      return Colors.amber.withOpacity(.3);
    } else {
      return Colors.grey.withOpacity(.3);
    }
  }

  Color getTextColor(String method) {
    if (method.toLowerCase().contains('get')) {
      return Colors.green.shade800;
    } else if (method.toLowerCase().contains('post')) {
      return Colors.amber.shade800;
    } else {
      return Colors.grey.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Insets.sm, vertical: Insets.xs),
      decoration: BoxDecoration(
        borderRadius: Corners.smBorder,
        color: getMethodColor(status),
      ),
      child: Text(
        status,
        style: TextStyles.callout3.copyWith(color: getTextColor(status)),
      ),
    );
  }
}
