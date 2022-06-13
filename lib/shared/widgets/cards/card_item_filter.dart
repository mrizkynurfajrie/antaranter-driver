import 'package:antaranter_driverapp/features/posting/customer_posting/controller_customer_posting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';

class CardItemFilter extends StatefulWidget {
  const CardItemFilter({
    Key? key,
    required this.data,
    this.showIcon = false,
    this.values = true,
  }) : super(key: key);

  final dynamic data;
  final bool showIcon;
  final bool values;
  @override
  State<CardItemFilter> createState() => _CardItemFilterState();
}

class _CardItemFilterState extends State<CardItemFilter> {
  final ControllerCustomerPosting controllerOrder = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx( 
      () => Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: widget.values
                ? BorderSide(
                    width: 1.5,
                    color: controllerOrder.search.value == widget.data['name']
                        ? AppColor.successColor
                        : AppColor.weakColor)
                : BorderSide(
                    width: 1.5,
                    color: controllerOrder.search.value == widget.data
                        ? AppColor.successColor
                        : AppColor.weakColor),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 15, left: 10, right: 0),
          child: Row(
            children: [
              // Padding(padding: const EdgeInsets.all(8.0), child: icon),
              Expanded(
                child: widget.values
                    ? Text(
                        widget.data['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.textBase.copyWith(
                            color: controllerOrder.search.value ==
                                    widget.data['name']
                                ? AppColor.successColor
                                : AppColor.neutral),
                      )
                    : Text(
                        widget.data,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.body1.copyWith(
                            color: controllerOrder.search.value == widget.data['name']
                                ? AppColor.successColor
                                : AppColor.neutral),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
