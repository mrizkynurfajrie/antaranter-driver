import 'package:flutter/material.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';
import 'package:intakemobile/shared/widgets/cards/card_rounded_border.dart';

class ListMenuLeftIconWithArrow extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final String imageUrl;

  const ListMenuLeftIconWithArrow(
      {Key? key,
      this.onTap,
      this.title,
      this.titleStyle,
      this.subTitle,
      this.subTitleStyle,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: CardRoundedBorder(
          borderColor: Colors.transparent,
          padding: EdgeInsets.all(Insets.xl),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                width: IconSizes.lg,
              ),
              horizontalSpace(Insets.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title ?? "",
                      style: titleStyle ?? TextStyles.subtitle2,
                    ),
                    verticalSpace(Insets.xs),
                    Text(
                      subTitle ?? "",
                      style: subTitleStyle ?? TextStyles.small1,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColor.secondColor.shade500,
              )
            ],
          )),
    );
  }
}
