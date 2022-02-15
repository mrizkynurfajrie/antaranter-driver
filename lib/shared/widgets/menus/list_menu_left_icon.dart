import 'package:flutter/material.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';

class ListMenuLeftIcon extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? subTitle;
  final String imageUrl;

  const ListMenuLeftIcon(
      {Key? key, this.onTap, this.title, this.subTitle, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: CardRoundedBorder(
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
                      style: TextStyles.subtitle2
                          .copyWith(color: AppColor.bodyColor),
                    ),
                    verticalSpace(Insets.xs),
                    Text(
                      subTitle ?? "",
                      style: TextStyles.body1,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
