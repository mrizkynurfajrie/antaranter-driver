import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class StepBar extends StatefulWidget {
  final int step;
  final int stepNow;

  const StepBar({Key? key, this.step = 3, this.stepNow = 1}) : super(key: key);

  @override
  _StepBarState createState() => _StepBarState();
}

class _StepBarState extends State<StepBar> {
  double width = Get.width / 4.7;
  @override
  void initState() {
    if (widget.step == 3) {
      width = Get.width / 4.6;
    } else if (widget.step == 2) {
      width = Get.width / 3.1;
    } else {
      width = Get.width / 6.3;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: width,
          decoration: widget.stepNow >= 1
              ? const BoxDecoration(
                  color: AppColor.successColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  ))
              : const BoxDecoration(
                  color: AppColor.weak2Color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                  )),
        ),
        horizontalSpace(5),
        widget.step > 2
            ? Container(
                height: 10,
                width: width,
                decoration: widget.stepNow >= 2
                    ? const BoxDecoration(
                        color: AppColor.successColor,
                      )
                    : const BoxDecoration(
                        color: AppColor.weak2Color,
                      ),
              )
            : Container(),
        horizontalSpace(5),
        widget.step == 2
            ? Container(
                height: 10,
                width: width,
                decoration: widget.step == 2 && widget.stepNow == 2
                    ? const BoxDecoration(
                        color: AppColor.successColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ))
                    : const BoxDecoration(
                        color: AppColor.weak2Color,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        )),
              )
            : Container(),
        widget.step > 3
            ? Container(
                height: 10,
                width: width,
                decoration: widget.stepNow >= 3
                    ? const BoxDecoration(
                        color: AppColor.successColor,
                      )
                    : const BoxDecoration(
                        color: AppColor.weak2Color,
                      ),
              )
            : Container(),
        widget.step == 4 ? horizontalSpace(5) : Container(),
        widget.step > 2
            ? Container(
                height: 10,
                width: width,
                decoration: widget.step == 3 && widget.stepNow == 3
                    ? const BoxDecoration(
                        color: AppColor.successColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ))
                    : widget.step == 4 && widget.stepNow == 4
                        ? const BoxDecoration(
                            color: AppColor.successColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ))
                        : const BoxDecoration(
                            color: AppColor.weak2Color,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            )),
              )
            : Container(),
        horizontalSpace(15),
        Text(
          "${widget.stepNow}/${widget.step}",
          style: TextStyles.body1,
        )
      ],
    );
  }
}
