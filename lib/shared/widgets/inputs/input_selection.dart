import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class InputSelection extends StatefulWidget {
  final String label;
  final String hintText;
  final Function onTap;
  final String valueText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffixLabel;

  const InputSelection({
    Key? key,
    this.label = '',
    required this.valueText,
    required this.onTap,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixLabel,
  }) : super(key: key);

  @override
  State<InputSelection> createState() => _InputSelectionState();
}

class _InputSelectionState extends State<InputSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.label != ''
                  ? Container(
                      padding: EdgeInsets.only(bottom: Insets.xs),
                      child: Text(
                        widget.label,
                        style: TextStyles.textBase,
                      ),
                    )
                  : Container(),
              const Spacer(),
              if (widget.suffixLabel != null)
                widget.suffixLabel!
              else
                Container()
            ],
          ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              widget.onTap();
            },
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.med, vertical: Insets.sm),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: Corners.lgBorder,
                  border: Border.all(
                      width: Strokes.thin, color: AppColor.bodyColor.shade300)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: Insets.med),
                      child: widget.prefixIcon!,
                    )
                  else
                    const SizedBox(),
                  Expanded(
                    child: Text(
                      widget.valueText,
                      style: widget.valueText != widget.hintText
                          ? TextStyles.body2
                          : TextStyles.body2
                              .copyWith(color: AppColor.bodyColor.shade600),
                    ),
                  ),
                  // const Spacer(),
                  widget.suffixIcon ??
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: IconSizes.med,
                        color: AppColor.bodyColor.shade600,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
