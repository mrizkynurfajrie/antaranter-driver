// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class ButtonSwitch extends StatefulWidget {
  final bool value;
  final Function(bool?) onChange;
  final double? size;
  final Color? trackColor;

  ButtonSwitch(
      {required this.value,
      required this.onChange,
      this.size = 1,
      this.trackColor});

  @override
  _ButtonSwitchState createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  late bool v;

  @override
  void initState() {
    v = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.size!,
      child: CupertinoSwitch(
          activeColor: widget.trackColor ?? AppColor.successColor,
          value: widget.value,
          onChanged: widget.onChange),
    );
  }
}
