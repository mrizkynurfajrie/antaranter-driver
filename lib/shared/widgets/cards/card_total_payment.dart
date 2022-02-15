import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/format_currency.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';

class CardTotalPayment extends StatelessWidget {
  final String? title;
  final int amount;
  final int fee;
  final int voucher;
  final String? nominalText;

  const CardTotalPayment({
    Key? key,
    this.title,
    required this.amount,
    this.fee = 0,
    this.voucher = 0,
    this.nominalText,
  }) : super(key: key);

  // Widget _voucher() {
  //   if (voucher > 0) {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         verticalSpace(Insets.med),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'Voucher',
  //                 style: TextStyles.small1,
  //               ),
  //             ),
  //             Expanded(
  //               child: Text(
  //                 priceFormat(voucher),
  //                 style: TextStyles.small1,
  //                 textAlign: TextAlign.end,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );
  //   } else {
  //     return verticalSpace(0);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'totalPay'.tr,
          style: TextStyles.textBase,
        ),
        verticalSpace(Insets.sm),
        CardRoundedBorder(
          borderRadius: 10.w,
          child: Text(
            priceFormat(fee + amount - voucher),
            style: TextStyles.textLgBold,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
