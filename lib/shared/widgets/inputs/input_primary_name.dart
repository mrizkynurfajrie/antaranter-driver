import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class InputName extends StatefulWidget {
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
  final EdgeInsets? margin;

  const InputName({
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
    this.margin,
  }) : super(key: key);

  @override
  _InputNameState createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != ''
            ? Container(
              margin: EdgeInsets.only(left: 16.w, bottom: Insets.xs),
                child: Text(
                  widget.label,
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral,
                  ),
                ),
              )
            : verticalSpace(0),
        Container(
          padding: widget.padding,
          margin: widget.margin,
          width: widget.boxWidth,
          child: TextFormField(
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            maxLength: widget.maxLenght,
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
            validator: (value) {
              if(!isValidName(name: value.toString())) {
                return '- Nama minimal 3 karakter';
              }
            },
            style: TextStyles.body2,
            decoration: inputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
