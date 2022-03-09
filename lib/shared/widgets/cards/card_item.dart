import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    Key? key,
    required this.data,
    this.showIcon = false,
    this.values = true,
  }) : super(key: key);

  final dynamic data;
  final bool showIcon;
  final bool values;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom:  BorderSide(
              width: 1.5,
              color: AppColor.greyColor,
            ),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 0),
          child: Row(
            children: [
              // Padding(padding: const EdgeInsets.all(8.0), child: icon),
              Expanded(
                child: Text(widget.data['name'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textBase
                        .copyWith(color: AppColor.greyColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
