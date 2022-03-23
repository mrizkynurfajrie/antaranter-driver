import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class InputTime extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final TimeOfDay? initialTime;
  final TimeOfDay? timePicked;
  final ValueSetter<TimeOfDay> selectedTime;
  final ValueSetter<bool> isValid;
 

  const InputTime({
    Key? key,
    this.hintText = '',
    this.validate,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.initialTime,
    this.timePicked,
    required this.selectedTime,
    required this.isValid,
    
  }) : super(key: key);

  @override
  _InputTimeState createState() => _InputTimeState();
}

class _InputTimeState extends State<InputTime> {
  String _time = '';

  void _selectTime() async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: widget.initialTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );

    if (timeOfDay != null) {
      setState(() {
        _time = '${timeOfDay.hour}:${timeOfDay.minute}:00';
      });
      widget.controller.text = _time;
      widget.selectedTime(timeOfDay);
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
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
            onTap: _selectTime,
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
                    return 'Pilih Waktu';
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
        ],
      ),
    );
  }
}
