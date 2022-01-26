import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/buttons/button_primary.dart';
import 'package:intakemobile/shared/widgets/others/loading_indicator.dart';

class ButtonBottomOne extends StatelessWidget {
  final String label;
  final Function onTap;
  final bool enable;
  final bool isLoading;
  final Widget? widgetTop;
  final Widget? widgetBot;

  const ButtonBottomOne({
    Key? key,
    required this.label,
    required this.onTap,
    this.enable = true,
    this.isLoading = false,
    this.widgetTop,
    this.widgetBot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.med),
        decoration: BoxDecoration(
            color: AppColor.whiteColor, boxShadow: Shadows.shadowsUp),
        child: Column(
          children: [
            widgetTop != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: Insets.lg),
                    child: widgetTop,
                  )
                : Container(),
            isLoading
                ? loadingIndicatorBottom(context)
                : ButtonPrimary(
                    enable: enable,
                    onPressed: () {
                      onTap();
                    },
                    label: label),
            widgetBot ?? Container(),
          ],
        ),
      ),
    );
  }
}
