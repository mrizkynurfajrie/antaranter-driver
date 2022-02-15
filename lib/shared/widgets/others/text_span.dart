import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

Widget textCenter(String text) {
  return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: TextStyles.inter,
        textAlign: TextAlign.center,
      ));
}

Widget textLeft(String text) {
  return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        style: TextStyles.inter,
        textAlign: TextAlign.left,
      ));
}

space() {
  return TextSpan(
    text: " ",
    style: TextStyles.inter.copyWith(
      color: Colors.black,
      height: 1.5,
    ),
  );
}

textSpanNormal(String text) {
  return TextSpan(
    text: text,
    style: TextStyles.inter.copyWith(
      color: Colors.black,
      height: 1.5,
    ),
  );
}

textSpanBase(String text) {
  return TextSpan(
    text: text,
    style: TextStyles.textBase.copyWith(
      color: Colors.black,
      height: 1.5,
    ),
  );
}

textSpanBaseColor(String text, Color color) {
  return TextSpan(
    text: text,
    style: TextStyles.textBase.copyWith(
      color: color,
      height: 1.5,
    ),
  );
}

textSpanBold(String text) {
  return TextSpan(
    text: text,
    style: TextStyles.textBaseBold,
  );
}

textSpanItalic(String text) {
  return TextSpan(
    text: text,
    style: TextStyles.inter.copyWith(
        color: Colors.black, height: 1.5, fontStyle: FontStyle.italic),
  );
}

textRequired(String text) {
  return TextSpan(
    text: text,
    style: TextStyles.inter.copyWith(
        color: AppColor.errorColor, height: 1.5, fontStyle: FontStyle.italic),
  );
}

Widget textRow(List<TextSpan> children) {
  return RichText(
    text: TextSpan(
      text: "",
      style: TextStyles.inter.copyWith(color: Colors.black, height: 1.5),
      children: children,
    ),
  );
}

Widget rowNumber({required String number, required Widget child}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        number,
        style: TextStyles.inter.copyWith(color: Colors.black, height: 1.5),
        textAlign: TextAlign.left,
      ),
      Flexible(
        child: Container(child: child),
      ),
    ],
  );
}

Widget info({required Widget child}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.icCheck,
          fit: BoxFit.cover,
          width: IconSizes.lg,
        ),
        horizontalSpace(10),
        Flexible(child: Container(child: child))
      ],
    ),
  );
}
