import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class InputNumber extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController? controller;
  final int? maxLength;
  final bool? enable;
  final String? type;
  final TextStyle? labelStyle;

  const InputNumber({
    Key? key,
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.controller,
    this.maxLength,
    this.enable = true,
    this.type,
    this.labelStyle,
  }) : super(key: key);

  @override
  _InputNumberState createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
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
                    style: widget.labelStyle ?? TextStyles.textBase,
                  ),
                )
              : verticalSpace(0),
          TextFormField(
            enabled: widget.enable,
            key: widget.key,
            enableInteractiveSelection: widget.enable ?? true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange,
            keyboardType: TextInputType.number,
            controller: widget.controller,
            inputFormatters: widget.maxLength == null && widget.type == 'emoney'
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputMask(
                      mask: '9999 9999 9999 9999',
                      placeholder: ' ',
                      maxPlaceHolders: 19,
                      reverse: false,
                    ),
                  ]
                : widget.maxLength == null && widget.type == 'phone'
                    ? [
                        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                        FilteringTextInputFormatter.digitsOnly,
                      ]
                    : widget.maxLength != null
                        ? [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(widget.maxLength),
                          ]
                        : widget.maxLength == null
                            ? [
                                FilteringTextInputFormatter.digitsOnly,
                              ]
                            : [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
            validator: widget.validate,
            style: TextStyles.textBase,
            decoration: inputDecoration(
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon),
          ),
        ],
      ),
    );
  }
}
