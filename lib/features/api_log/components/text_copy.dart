
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextCopy extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextCopy({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () async {
        await Clipboard.setData(ClipboardData(text: text));
        Get.snackbar(
          '',
          "Copied to Clipboard",
          snackPosition: SnackPosition.BOTTOM,
          snackStyle: SnackStyle.GROUNDED,
          titleText: const SizedBox(),
          duration: const Duration(milliseconds: 1500),
        );
      },
      child: Text(
        text,
        style: style ?? TextStyles.small1,
      ),
    );
  }
}
