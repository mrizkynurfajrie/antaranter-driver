import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class Receipt extends StatelessWidget {
  final String? receipt;
  final Widget? customReceipt;

  const Receipt({Key? key, this.receipt, this.customReceipt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return receipt != null
        ? Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Html(
              data: """
          <pre style="font-size: .83rem;">
          $receipt
          </pre>
          """,
            ))
        : customReceipt != null
            ? customReceipt!
            : verticalSpace(0);
  }
}
