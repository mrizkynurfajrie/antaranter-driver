import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/helpers/format_currency.dart';
import 'package:intakemobile/shared/widgets/input_format/input_format_money.dart';

class InputCurrency extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
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

  const InputCurrency({
    Key? key,
    this.hintText = 'Masukkan Nominal',
    this.validate,
    this.prefixIcon,
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
  }) : super(key: key);

  @override
  _InputCurrencyState createState() => _InputCurrencyState();
}

class _InputCurrencyState extends State<InputCurrency> {
  int nominal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
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
              : verticalSpace(0),
          TextFormField(
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
              ThousandsSeparatorInputFormatter()
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

                  if (widget.maxValue != null && nominal > widget.maxValue!) {
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
                border: BorderStyles.enableTextField,
                focusedBorder: BorderStyles.focusTextField,
                enabledBorder: BorderStyles.enableTextField,
                errorBorder: BorderStyles.errorTextField,
                disabledBorder: BorderStyles.disableTextField,
                errorMaxLines: 5,
                prefixIcon: widget.prefixIcon ??
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.med, vertical: Insets.med),
                      child: Text(
                        'Rp',
                        style: TextStyles.subtitle1,
                      ),
                    ),
                prefixIconConstraints:
                    BoxConstraints(minHeight: Sizes.lg, minWidth: Sizes.lg),
                suffixIcon: widget.suffixIcon,
                hintStyle: TextStyles.body2
                    .copyWith(color: AppColor.bodyColor.shade300)),
          ),
        ],
      ),
    );
  }
}
