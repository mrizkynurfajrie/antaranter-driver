import 'package:basecode_app/features/profile/upgrade_account/controller_upgrade_account.dart';
import 'package:basecode_app/shared/constants/colors.dart';
import 'package:basecode_app/shared/constants/styles.dart';
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
  final ControllerUpgradeAccount controllerUpgradeaControllerUpgradeAccount =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: widget.values
                ? BorderSide(
                    width: 1.5,
                    color: controllerUpgradeaControllerUpgradeAccount
                                .search.value ==
                            widget.data['code']
                        ? AppColor.successColor
                        : AppColor.weakColor)
                : BorderSide(
                    width: 1.5,
                    color: controllerUpgradeaControllerUpgradeAccount
                                .search.value ==
                            widget.data
                        ? AppColor.successColor
                        : AppColor.weakColor),
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
                child: widget.values
                    ? Text(
                        widget.data['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.textBase.copyWith(
                            color: controllerUpgradeaControllerUpgradeAccount
                                        .search.value ==
                                    widget.data['code']
                                ? AppColor.successColor
                                : AppColor.bodyColor),
                      )
                    : Text(
                        widget.data,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body1.copyWith(
                            color: controllerUpgradeaControllerUpgradeAccount
                                        .search.value ==
                                    widget.data
                                ? AppColor.successColor
                                : AppColor.bodyColor),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
