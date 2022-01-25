import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/cards/card_rounded_border.dart';

class CardBottomsheet extends StatelessWidget {
  const CardBottomsheet({Key? key, required this.child, this.padding})
      : super(key: key);
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ??
            EdgeInsets.symmetric(vertical: Insets.sm, horizontal: Insets.lg),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Corners.xlRadius),
            color: AppColor.whiteColor),
        child: Stack(
          children: [
            Positioned(
              top: Insets.sm,
              right: Get.width * 0.35,
              left: Get.width * 0.35,
              child: SizedBox(
                height: Strokes.thick,
                child: CardRoundedBorder(
                  color: AppColor.bodyColor.shade200,
                  borderColor: AppColor.bodyColor.shade200,
                  child: Container(),
                  padding: EdgeInsets.all(Insets.xs),
                  shadow: Shadows.none,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Insets.med),
              child: child,
            )
          ],
        ));
  }
}
