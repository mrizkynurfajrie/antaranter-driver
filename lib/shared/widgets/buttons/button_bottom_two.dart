import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/others/loading_indicator.dart';

class ButtonBottomTwo extends StatelessWidget {
  final Widget? button1;
  final Widget button2;
  final Widget? topWidget;
  final bool isLoading;

  const ButtonBottomTwo({
    Key? key,
    this.button1,
    required this.button2,
    this.topWidget,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.lg, vertical: Insets.med),
              decoration: BoxDecoration(
                  color: AppColor.bodyColor[50], boxShadow: Shadows.shadowsUp),
              child: Column(
                children: [
                  topWidget != null
                      ? Padding(
                          padding: EdgeInsets.only(bottom: Insets.lg),
                          child: topWidget,
                        )
                      : verticalSpace(0),
                  isLoading
                      ? loadingIndicatorBottom(context)
                      : Row(
                          children: [
                            button1 != null
                                ? Expanded(child: button1 ?? horizontalSpace(0))
                                : horizontalSpace(0),
                            horizontalSpace(button1 != null ? Insets.med : 0),
                            Expanded(child: button2)
                          ],
                        ),
                ],
              )),
        ),
      ],
    );
  }
}
