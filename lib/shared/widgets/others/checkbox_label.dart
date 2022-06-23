import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class CheckboxLabel extends StatefulWidget {
  final Function(bool) onChange;
  final String label;
  final TextStyle? labelStyle;
  final Color? colorBorder;
  final double? width;
  final bool active;
  const CheckboxLabel(
      {Key? key,
      required this.onChange,
      required this.label,
      this.colorBorder,
      this.width,
      this.labelStyle,
      this.active = true})
      : super(key: key);

  @override
  _CheckboxLabelState createState() => _CheckboxLabelState();
}

class _CheckboxLabelState extends State<CheckboxLabel> {
  bool _isFavorit = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.active) {
          setState(() {
            _isFavorit = !_isFavorit;
          });
          widget.onChange(_isFavorit);
        }
      },
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: _isFavorit
                ? BoxDecoration(
                    borderRadius: Corners.smBorder,
                    color: widget.colorBorder ?? Theme.of(context).primaryColor)
                : BoxDecoration(
                    borderRadius: Corners.smBorder,
                    border: Border.all(
                        width: 2,
                        color:
                            widget.colorBorder ?? AppColor.bodyColor.shade700),
                    color: Theme.of(context).scaffoldBackgroundColor),
            child: _isFavorit
                ? const Icon(
                    Icons.check,
                    size: 22.0,
                    color: Colors.white,
                  )
                : Container(),
          ),
          horizontalSpace(Insets.sm),
          SizedBox(
              width: widget.width ??
                  MediaQuery.of(context).size.width -
                      44 -
                      Insets.sm -
                      (2 * Insets.xl),
              child: Text(
                widget.label,
                style: widget.labelStyle ??
                    TextStyles.small1.copyWith(fontWeight: FontWeight.w700),
                maxLines: 2,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              ))
        ],
      ),
    );
  }
}
