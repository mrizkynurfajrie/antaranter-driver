import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/format_currency.dart';

class InfoSaldo extends StatelessWidget {
  const InfoSaldo({
    Key? key,
    required this.saldo,
    this.padding,
    this.alignment,
  }) : super(key: key);

  final int saldo;
  final EdgeInsets? padding;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 20.w),
      alignment: alignment ?? Alignment.centerRight,
      child: Text(
        '${"Your Balance".tr} ${priceFormat(saldo)}',
        style: TextStyles.saldo14.copyWith(
          color: AppColor.secondaryColor.shade600,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
