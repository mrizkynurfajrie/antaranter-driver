import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class ItemVa extends StatelessWidget {
  final String namaProduct;
  final bool isSelected;
  final Function() onTap;

  const ItemVa(
      {Key? key,
      required this.namaProduct,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: Insets.lg),
        padding:
            EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.med),
        decoration: BoxDecoration(
          border: Border.all(
            width: Insets.xs * 0.5,
            color: (isSelected)
                ? Theme.of(context).primaryColor
                : AppColor.bodyColor.shade300,
          ),
          color: (isSelected)
              ? Theme.of(context).primaryColor
              : AppColor.whiteColor,
          borderRadius: Corners.lgBorder,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: Get.width * 0.3,
                  child: Text(namaProduct,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: (isSelected)
                          ? TextStyles.body1
                              .copyWith(color: AppColor.whiteColor)
                          : TextStyles.body1),
                ),
                verticalSpace(Insets.xs)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
