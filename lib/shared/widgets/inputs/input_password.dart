import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final EdgeInsets? padding;
  final EdgeInsets? margin;

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
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != ''
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: Insets.xs,
                    left: 4.w,
                  ),
                  child: Text(
                    widget.label,
                    style: widget.labelStyle ?? TextStyles.small1,
                  ),
                )
              : verticalSpace(0),
          Container(
            padding: widget.padding ?? EdgeInsets.zero,
            margin: widget.margin ?? EdgeInsets.zero,
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
                    if (!isValidPassword(password: value.toString())) {
                      return '- Kata Sandi minimal 6 karakter\n' +
                          // '- Diawali huruf kapital\n' +
                          '- Terdiri dari kombinasi huruf & angka';
                      // dan symbol (!@#\$%^&*(),.?":{}|<>])';
                    }
                  },
              style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s18, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.neutral.shade200, width: 1),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s14, fontStyle: FontStyle.italic),
                prefixIcon: widget.prefixIcon,
                suffixIconConstraints:
                    BoxConstraints(maxHeight: 15.h, maxWidth: 15.w),
                suffixIcon: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onTap,
                  child: _obsecureText
                      ? Icon(
                          Icons.visibility_off,
                          size: IconSizes.sm,
                        )
                      : Icon(
                          Icons.visibility,
                          size: IconSizes.sm,
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
