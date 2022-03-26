import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class InputIconUnderline extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final bool? enable;
  final bool? isDense;
  final dynamic maxLines;
  final String? initialValue;

  const InputIconUnderline({
    Key? key,
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.icon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.enable = true,
    this.maxLines = 1,
    this.initialValue,
    this.isDense = false,
  }) : super(key: key);

  @override
  _InputIconUnderlineState createState() => _InputIconUnderlineState();
}

class _InputIconUnderlineState extends State<InputIconUnderline> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      maxLines: widget.maxLines,
      enabled: widget.enable,
      enableInteractiveSelection: true,
      cursorColor: AppColor.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.obsecureText,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      validator: widget.validate,
      style: TextStyles.body2,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.body2,
        isDense: widget.isDense,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: Strokes.med,
          ),
        ),
      ),
    );
  }
}
