import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class InputPrimary extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
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
  final String? initialValue;

  const InputPrimary({
    Key? key,
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.enable = true,
    this.maxLines = 1,
    this.initialValue,
  }) : super(key: key);

  @override
  _InputPrimaryState createState() => _InputPrimaryState();
}

class _InputPrimaryState extends State<InputPrimary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
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
          TextFormField(
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            enabled: widget.enable,
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange,
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
        ],
      ),
    );
  }
}
