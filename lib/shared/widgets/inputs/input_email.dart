import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputEmail extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final ValueSetter<bool> isValid;
  final ValueSetter<String> email;
  final String? Function(String?)? onChange;
  final double? boxWidth;

  const InputEmail({
    Key? key,
    this.hintText = '',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    required this.isValid,
    required this.email,
    this.boxWidth,
  }) : super(key: key);

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
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
                    style: TextStyles.small1,
                  ),
                )
              : verticalSpace(0),
          TextFormField(
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            controller: widget.controller,
            obscureText: widget.obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            onChanged: widget.onChange,
            validator: widget.validate ??
                (value) {
                  if (!GetUtils.isEmail(value.toString())) {
                    widget.isValid(false);
                    widget.email('');
                    return 'Format email belum benar';
                  }
                  widget.email(value.toString());
                  widget.isValid(true);
                  return null;
                },
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
