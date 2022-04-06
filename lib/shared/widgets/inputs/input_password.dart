// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class InputPassword extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double? boxWidth;

  const InputPassword({
    Key? key,
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.labelStyle,
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.boxWidth,
  }) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obsecureText = true;
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
                    bottom: Insets.xs,
                  ),
                  child: Text(
                    widget.label,
                    style: widget.labelStyle ?? TextStyles.small1,
                  ),
                )
              : verticalSpace(0),
          SizedBox(
            width: widget.boxWidth,
            child: TextFormField(
              enableInteractiveSelection: true,
              cursorColor: Theme.of(context).primaryColor,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: widget.onChange,
              keyboardType: TextInputType.text,
              controller: widget.controller,
              obscureText: _obsecureText,
              inputFormatters: widget.inputFormatters,
              textCapitalization: widget.textCapitalization,
              validator: widget.validate ??
                  (value) {
                    // if (!isValidPassword(password: value.toString())) {
                    //   return '- Password minimal 8 karakter\n' +
                    //       // '- Diawali huruf kapital\n' +
                    //       '- Terdiri dari huruf besar, huruf kecil, dan angka';
                    //   // dan symbol (!@#\$%^&*(),.?":{}|<>])';
                    // }
                  },
              style: TextStyles.textBase,
              decoration: inputDecoration(
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: Insets.lg),
                  child: InkWell(
                    child: _obsecureText
                        ? Icon(
                            Icons.visibility_off,
                            size: IconSizes.med,
                          )
                        : Icon(
                            Icons.visibility,
                            size: IconSizes.med,
                          ),
                    onTap: onTap,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
