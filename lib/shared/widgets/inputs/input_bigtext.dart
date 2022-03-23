import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class InputBigText extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function() onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final bool? enable;
  final dynamic maxLines;
  final dynamic maxLenght;
  final String? initialValue;
  final double? boxWidth;
  final EdgeInsets? padding;

  const InputBigText({
    Key? key,
    required this.hintText,
    this.validate,
    required this.onTap,
    required this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.enable = true,
    this.maxLines = 1,
    this.maxLenght,
    this.initialValue,
    this.boxWidth,
    this.padding,
  }) : super(key: key);

  @override
  _InputBigTextState createState() => _InputBigTextState();
}

class _InputBigTextState extends State<InputBigText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
        Container(
          padding: widget.padding,
          width: widget.boxWidth,
          child: TextFormField(
            maxLength: widget.maxLenght,
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            enabled: widget.enable,
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: widget.validate,
            style: TextStyles.body2,
            decoration: inputDecoration(
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon),
          ),
        ),
      ],
    );
  }
}
