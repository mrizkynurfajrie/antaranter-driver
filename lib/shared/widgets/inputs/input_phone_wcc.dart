import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class InputPhoneWcc extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final ValueSetter<String> phoneNumber;
  final Function(String?)? onSave;
  final Function()? onEditingComplete;
  const InputPhoneWcc({
    Key? key,
    this.hintText = 'Masukkan nomor telepon',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = 'Nomor Telepon',
    required this.controller,
    required this.phoneNumber,
    this.onSave,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  _InputPhoneWccState createState() => _InputPhoneWccState();
}

class _InputPhoneWccState extends State<InputPhoneWcc> {
  @override
  void initState() {
    super.initState();
  }

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
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange ??
                (value) {
                  widget.phoneNumber(value);
                },
            onEditingComplete: widget.onEditingComplete,
            onSaved: widget.onSave,
            keyboardType: TextInputType.phone,
            controller: widget.controller,
            validator: widget.validate ??
                (value) {
                  if (!GetUtils.isPhoneNumber(value.toString())) {
                    return 'Masukkan nomor Telepon dengan benar';
                  }
                  return null;
                },
            style: TextStyles.textBaseBold,
            inputFormatters: [LengthLimitingTextInputFormatter(13)],
            decoration: inputDecoration(
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
