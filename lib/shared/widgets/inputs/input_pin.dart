import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:pinput/pin_put/pin_put.dart';

class InputPin extends StatefulWidget {
  const InputPin(
      {Key? key,
      required this.pin,
      required this.controller,
      required this.isValid})
      : super(key: key);

  final TextEditingController controller;
  final ValueSetter<bool> isValid;
  final ValueSetter<String> pin;

  @override
  State<InputPin> createState() => _InputPinState();
}

class _InputPinState extends State<InputPin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.xl,
      width: Get.width * 0.81,
      child: PinPut(
        fieldsCount: 6,
        obscureText: '•',
        onChanged: (String pin) {
          widget.pin(pin);
          widget.isValid(pin.length == 6);
        },
        eachFieldWidth: IconSizes.med,
        eachFieldHeight: IconSizes.med,
        controller: widget.controller,
        selectedFieldDecoration: Borders.borderPin(
          borderColor: AppColor.successColor,
          strokeWidth: Strokes.thin,
        ),
        submittedFieldDecoration: Borders.borderPin(),
        followingFieldDecoration: Borders.borderPin(),
        fieldsAlignment: MainAxisAlignment.center,
        eachFieldMargin: EdgeInsets.only(right: Insets.xs),
        pinAnimationType: PinAnimationType.scale,
        animationDuration: const Duration(milliseconds: 160),
        keyboardType: TextInputType.number,
        keyboardAppearance: Brightness.light,
      ),
    );
  }
}
