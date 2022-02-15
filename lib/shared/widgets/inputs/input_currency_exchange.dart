import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/format_currency.dart';
import 'package:intake_rider/shared/widgets/input_format/input_format_money.dart';

class InputCurrencyExchange extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final String prefixCurrency;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController? controller;
  final TextStyle? fontStyle;
  final ValueSetter<int> nominal;
  final int? minValue;
  final int? maxValue;
  final bool? enable;
  final AutovalidateMode? autoValidate;
  final ValueSetter<bool> isValid;
  final bool isShowArrow;
  final String flagIcon;

  const InputCurrencyExchange({
    Key? key,
    this.hintText = 'Masukkan Nominal',
    this.validate,
    required this.prefixCurrency,
    this.suffixIcon,
    this.label = '',
    this.fontStyle,
    this.controller,
    required this.nominal,
    this.minValue,
    this.maxValue,
    this.enable = true,
    this.autoValidate,
    required this.isValid,
    this.isShowArrow = false,
    required this.flagIcon,
  }) : super(key: key);

  @override
  _InputCurrencyState createState() => _InputCurrencyState();
}

class _InputCurrencyState extends State<InputCurrencyExchange> {
  int nominal = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ''
            ? Container(
                margin: EdgeInsets.only(
                  bottom: Insets.sm,
                ),
                child: Text(
                  widget.label,
                  style: TextStyles.textBase,
                ),
              )
            : SizedBox.shrink(),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: widget.enable,
                enableInteractiveSelection: true,
                cursorColor: Theme.of(context).primaryColor,
                autovalidateMode:
                    widget.autoValidate ?? AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    int n = int.parse(value.replaceAll('.', ''));
                    widget.nominal(n);
                    setState(() {
                      nominal = n;
                    });
                  } else {
                    widget.nominal(0);
                    setState(() {
                      nominal = 0;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                controller: widget.controller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  ThousandsSeparatorInputFormatter(),
                  LengthLimitingTextInputFormatter(10)
                ],
                validator: widget.validate ??
                    (value) {
                      if (widget.minValue != null) {
                        if (nominal < widget.minValue!) {
                          widget.isValid(false);
                          return 'Minimal nominal ${priceFormat(widget.minValue)}';
                        }
                      } else {
                        if (nominal < 0) {
                          widget.isValid(false);
                          return 'Minimal nominal ${priceFormat(0)}';
                        }
                      }

                      if (widget.maxValue != null &&
                          nominal > widget.maxValue!) {
                        widget.isValid(false);
                        return 'Maksimal nominal ${priceFormat(widget.maxValue)}';
                      }

                      widget.isValid(true);

                      return null;
                    },
                style: widget.fontStyle ?? TextStyles.h6,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: Insets.med, vertical: Insets.lg),
                  hintText: widget.hintText,
                  border: enableTextField,
                  focusedBorder: focusTextField,
                  enabledBorder: enableTextField,
                  errorBorder: errorTextField,
                  disabledBorder: disableTextField,
                  errorMaxLines: 5,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Text(
                      widget.prefixCurrency,
                      style: TextStyles.textLg,
                    ),
                  ),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: Sizes.lg, minWidth: Sizes.lg),
                  suffixIcon: widget.suffixIcon,
                  hintStyle: TextStyles.body2
                      .copyWith(color: AppColor.bodyColor.shade300),
                ),
              ),
            ),
            Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: const Color(0xFFD8DCE1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.w,
                      bottom: 15.w,
                      left: 10.w,
                    ),
                    child: SvgPicture.asset(widget.flagIcon, width: 35.w),
                  ),
                  if (widget.isShowArrow) ...[
                    Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: AppColor.neutral.shade600,
                        size: 30.w,
                      ),
                    )
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  static OutlineInputBorder enableTextField = OutlineInputBorder(
    borderSide:
        BorderSide(color: AppColor.bodyColor.shade300, width: Strokes.xthin),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.r),
      bottomLeft: Radius.circular(8.r),
    ),
  );

  static OutlineInputBorder focusTextField = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColor.primary, width: Strokes.thin),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.r),
      bottomLeft: Radius.circular(8.r),
    ),
  );

  static OutlineInputBorder disableTextField = OutlineInputBorder(
    borderSide:
        BorderSide(color: AppColor.bodyColor.shade300, width: Strokes.xthin),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.r),
      bottomLeft: Radius.circular(8.r),
    ),
  );

  static OutlineInputBorder errorTextField = OutlineInputBorder(
    borderSide:
        const BorderSide(color: AppColor.errorColor, width: Strokes.thin),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.r),
      bottomLeft: Radius.circular(8.r),
    ),
  );
}
