import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class ButtonFilter extends StatelessWidget {
  final String label;
  final Function() onTap;

  const ButtonFilter({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.lg,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(Insets.xs),
          elevation: 0,
          primary: AppColor.bodyColor.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: Corners.lgBorder,
            side: BorderSide(
                color: AppColor.bodyColor.shade300, width: Strokes.thin),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                label,
                style: TextStyles.small1.copyWith(color: AppColor.bodyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.keyboard_arrow_down_outlined,
                    color: AppColor.bodyColor)),
          ],
        ),
      ),
    );
  }
}
