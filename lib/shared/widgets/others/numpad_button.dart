import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

class NumpadButton extends StatelessWidget {
  final String text;
  final bool number;
  final bool fill;
  final Function() onPressed;
  final Widget? view;

  const NumpadButton({
    Key? key,
    required this.text,
    this.number = true,
    required this.onPressed,
    this.fill = true,
    this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget label = number == false
        ? SizedBox(
            height: double.infinity,
            child: TextButton(
                onPressed: () {
                  onPressed();
                },
                child: view ?? Container()),
          )
        : ElevatedButton(
            child: Center(
              child: Text(
                text,
                style: TextStyles.text3xlBold
                    .copyWith(color: AppColor.neutral.shade600),
              ),
            ),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: AppColor.whiteColor,
              elevation: 0,
              shape: const CircleBorder(),
              onPrimary: Theme.of(context).primaryColor.withOpacity(.4),
            ),
          );

    return Container(
      child: label,
    );
  }
}
