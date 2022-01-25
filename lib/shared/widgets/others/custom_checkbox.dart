import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final Function(bool) onChange;
  const CustomCheckbox({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChange(_isChecked);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 22,
        height: 22,
        decoration: _isChecked
            ? BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.orange.shade600)
            : BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 2, color: Colors.orange.shade600),
                color: Theme.of(context).scaffoldBackgroundColor),
        child: _isChecked
            ? const Icon(
                Icons.check,
                size: 22.0,
                color: Colors.white,
              )
            : Container(),
      ),
    );
  }
}
