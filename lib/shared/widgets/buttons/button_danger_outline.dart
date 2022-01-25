// ignore_for_file: unnecessary_new, unnecessary_this

import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class ButtonDangerOutline extends StatelessWidget {
  final Function() _onPressed;
  final String _label;
  final double? _size;
  final Color? _color;
  final Color? outlineColor;
  final double? elevation;
  final EdgeInsets? _margin;

  const ButtonDangerOutline(
      {Key? key,
      required Function() onPressed,
      required String label,
      double? size,
      Color? color,
      this.outlineColor,
      EdgeInsets? margin,
      this.elevation})
      : this._onPressed = onPressed,
        this._label = label,
        this._size = size,
        this._margin = margin,
        this._color = color,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.med * 2,
      width: _size ?? double.infinity,
      margin: _margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          primary: _color ?? Theme.of(context).scaffoldBackgroundColor,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(Corners.lg),
            side: BorderSide(
                color: outlineColor ?? AppColor.errorColor, width: 1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _label,
                style: TextStyles.body1.copyWith(
                    color: AppColor.errorColor, fontSize: FontSizes.s14),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
