import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class PreviewPin extends StatelessWidget {
  final int length;
  final String text;
  final bool show;
  const PreviewPin(
      {Key? key, required this.length, required this.text, this.show = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(
        isActive: text.length >= i + 1,
        char: text.length > i ? text[i] : '',
        show: show,
      ));
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: Insets.xs * 2.5),
      child: Wrap(children: previewLength),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  final String char;
  final bool show;
  const Dot(
      {Key? key, this.isActive = false, required this.char, required this.show})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.10;
    return Container(
      padding: EdgeInsets.all(Insets.xs),
      child: SizedBox(
        width: width,
        height: Sizes.xl,
        child: Center(
            child: char.isNotEmpty
                ? Icon(
                    Icons.circle,
                    size: 14.w,
                    color: AppColor.neutral.shade600,
                  )
                : Icon(
                    Icons.circle_outlined,
                    size: 14.w,
                    color: AppColor.neutral.shade600,
                  )),
      ),
    );
  }
}
