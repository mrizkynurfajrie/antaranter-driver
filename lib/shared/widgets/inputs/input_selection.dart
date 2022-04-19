import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class InputSelection extends StatefulWidget {
  final String label;
  final String hintText;
  final Function onTap;
  final String valueText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffixLabel;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  const InputSelection({
    Key? key,
    this.label = '',
    required this.valueText,
    required this.onTap,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixLabel,
    this.padding,
    this.margin,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<InputSelection> createState() => _InputSelectionState();
}

class _InputSelectionState extends State<InputSelection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     widget.label != ''
          //         ? Container(
          //             padding: EdgeInsets.only(bottom: Insets.xs),
          //             child: Text(
          //               widget.label,
          //               style: TextStyles.inter.copyWith(
          //                 fontSize: FontSizes.s14,
          //                 fontWeight: FontWeight.w400,
          //               ),
          //             ),
          //           )
          //         : Container(),
          //     const Spacer(),
          //     if (widget.suffixLabel != null)
          //       widget.suffixLabel!
          //     else
          //       Container()
          //   ],
          // ),
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              widget.onTap();
            },
            child: Container(
              width: widget.width,
              height: widget.height,
              padding: widget.padding,
              margin: widget.margin,
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
                          ? TextStyles.inter.copyWith(
                              fontSize: FontSizes.s12,
                              fontWeight: FontWeight.w400,
                              color: AppColor.neutral,
                            )
                          : TextStyles.inter.copyWith(
                              color: AppColor.bodyColor.shade600,
                              fontSize: FontSizes.s12),
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
