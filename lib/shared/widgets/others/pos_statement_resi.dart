import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/assets.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class PosStatementResi extends StatelessWidget {
  const PosStatementResi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(AppLogos.pos, width: 50, fit: BoxFit.cover),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Insets.med),
              child: Text(
                "PT. Pos Indonesia (Persero) menyatakan tampilan ini merupakan bukti transaksi yang sah.",
                style: TextStyles.small1,
                textAlign: TextAlign.left,
              ),
            ),
          )
        ],
      ),
    );
  }
}
