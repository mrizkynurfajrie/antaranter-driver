import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key, this.height, this.color}) : super(key: key);

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 4.w;
        final dashHeight = height ?? Strokes.thin;
        final dashCount = (boxWidth / (1.3.w * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: color ?? AppColor.neutral.shade300),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
