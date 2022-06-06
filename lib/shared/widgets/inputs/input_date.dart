import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputDate extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueSetter<DateTime> selectedDate;
  final ValueSetter<bool> isValid;
  final double? boxWidth;
  final double? boxHeight;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const InputDate(
      {Key? key,
      this.hintText = 'Pilih Tanggal',
      this.validate,
      this.prefixIcon,
      this.suffixIcon,
      this.label = '',
      required this.controller,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      required this.selectedDate,
      required this.isValid,
      this.boxWidth,
      this.boxHeight,
      this.padding,
      this.margin})
      : super(key: key);

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  String _date = '';

  void _selectDate() async {
    var datePicked = await DatePicker.showSimpleDatePicker(context,
        initialDate: widget.initialDate ?? DateTime.now(),
        firstDate: widget.firstDate ?? DateTime(1900),
        lastDate: widget.lastDate ?? DateTime(2030),
        dateFormat: "dd-MMMM-yyyy",
        locale: DateTimePickerLocale.id,
        looping: false,
        textColor: Theme.of(context).primaryColor,
        cancelText: 'Batal',
        titleText: 'Pilih Tanggal',
        itemTextStyle: TextStyles.body2);

    if (datePicked != null) {
      setState(() {
        _date = DateFormat('yyyy-MM-dd').format(datePicked);
      });
      widget.controller.text = _date;
      widget.selectedDate(datePicked);
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ''
            ? Container(
                margin: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: Text(
                  widget.label,
                  style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s12,
                      color: AppColor.neutral,
                      fontWeight: FontWeight.w400),
                ),
              )
            : verticalSpace(0),
        Container(
          padding: widget.padding,
          width: widget.boxWidth,
          height: widget.boxHeight,
          margin: widget.margin ?? EdgeInsets.zero,
          child: TextFormField(
            onTap: _selectDate,
            readOnly: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.datetime,
            controller: widget.controller,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            validator: widget.validate ??
                (value) {
                  if (value.toString().isEmpty) {
                    widget.isValid(false);
                    return 'Pilih tanggal';
                  }

                  widget.isValid(true);
                  return null;
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
