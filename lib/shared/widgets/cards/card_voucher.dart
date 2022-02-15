import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/format_currency.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';

class CardVoucher extends StatelessWidget {
  const CardVoucher({
    Key? key,
    required this.amount,
    this.expired = '',
    required this.voucherId,
    required this.description,
    required this.voucherCode,
  }) : super(key: key);
  final int amount, voucherId;
  final String expired, description, voucherCode;
  @override
  Widget build(BuildContext context) {
    return CardRounded(
      margin: EdgeInsets.symmetric(vertical: Insets.xs),
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppIcons.bgCardVoucherPromo,
                  width: IconSizes.xxl * 1.5)),
          Row(
            children: [
              horizontalSpace(Insets.med * 4),
              dashLine(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Insets.lg, vertical: Insets.xs),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Diskon ${priceFormat(amount)}',
                        style: TextStyles.small1
                            .copyWith(fontWeight: FontWeight.w700)),
                    verticalSpace(Insets.xs),
                    Text('Voucher hemat $description',
                        style: TextStyles.small2
                            .copyWith(color: const Color(0xFF949494))),
                    verticalSpace(Insets.xs * 1.5),
                    Container(
                        width: Get.width / 2,
                        height: Insets.xs / 2,
                        color: const Color(0xFF949494)),
                    verticalSpace(Insets.med),
                    Text(
                      voucherCode,
                      style: TextStyles.small2.copyWith(
                        color: const Color(0xFFFF6900),
                        fontSize: FontSizes.s9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(Insets.xs * 1.5),
                    Text(
                      'Berlaku sampai $expired',
                      style: TextStyles.small2.copyWith(
                          color: const Color(0xFFFF6900),
                          fontSize: FontSizes.s9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dashLine() {
    return Column(
      children: List.generate(
          Get.height ~/ 60,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0
                      ? Colors.transparent
                      : const Color(0xFFE1E1E1),
                  width: 1,
                ),
              )),
    );
  }
}
