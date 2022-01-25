import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class InfoSyarat extends StatelessWidget {
  const InfoSyarat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Insets.med),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Dengan ini saya menyetujui',
                  style: TextStyles.small2.copyWith(color: Colors.grey),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Insets.xs),
                    child: Text(
                      'Syarat & Ketentuan',
                      style: TextStyles.small2.copyWith(
                          color: Colors.orange,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(5),
            Text(
              'PT POS Indonesia',
              style: TextStyles.small2.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
