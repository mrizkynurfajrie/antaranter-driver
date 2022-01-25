import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intakemobile/shared/constants/colors.dart';
import 'package:intakemobile/shared/constants/styles.dart';

// ignore: must_be_immutable
class MenuProfile extends StatelessWidget {
  final String menuTitle;
  final String? menuDesc;
  final String? icon;
  final Widget? customIcon;
  final Function() onTap;
  final Color? color;
  final Color? labelColor;
  final Color? descColor;
  final Color? arrowIconColor;
  final double? fontTitle;
  final bool? checked;
  final bool? customPreffixIcon;
  final bool? switchButton;
  final bool switchValue;
  final void Function(bool)? onChanged;
  final bool? arrow;
  final bool? titleCheck;
  final bool? useIcon;

  final double? height;
  final double? fontDesc;
  final Widget? suffixIcon;
  const MenuProfile({
    Key? key,
    required this.menuTitle,
    this.menuDesc,
    this.icon,
    required this.onTap,
    this.customIcon,
    this.color,
    this.labelColor,
    this.descColor,
    this.arrowIconColor,
    this.arrow = true,
    this.fontTitle,
    this.customPreffixIcon = false,
    this.checked,
    this.switchButton,
    this.switchValue = false,
    this.titleCheck = true,
    this.useIcon = true,
    this.height,
    this.fontDesc,
    // this.margin,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  // var _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          verticalSpace(21.w),
          Container(
            height: height ?? MediaQuery.of(context).size.width * 0.1,
            margin: const EdgeInsets.symmetric(vertical: 7),
            // decoration: BoxDecoration(
            //     color: color,
            //     border: Border.all(
            //       width: 1,
            //       color: Colors.grey.withOpacity(0.2),
            //     ),
            //     borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                useIcon == false
                    ? const SizedBox(
                        width: 20,
                      )
                    : customIcon ??
                        Container(
                          margin: EdgeInsets.only(right: 24.w, left: 14.5.w),
                          height: Get.height,
                          width: 20.w,
                          child: Image.asset(
                            icon!,
                            width: 30.w,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleCheck == true
                          ? Text(
                              menuTitle,
                              style: TextStyles.textBase,
                            )
                          : Container(),
                      // SizedBox(height: 5),
                      // menuDesc.isEmpty
                      //     ? Container()
                      //     : Text(
                      //         menuDesc,
                      //         style: TextStyle(
                      //             fontSize: fontDesc ?? 13.0,
                      //             color:
                      //                 descColor ?? TextStyles.subtitle2.color),
                      //         textAlign: TextAlign.start,
                      //         overflow: TextOverflow.clip,
                      //       )
                    ],
                  ),
                ),
                switchButton == true
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 10),
                        child: SizedBox(
                          width: 60,
                          child: Switch(
                              splashRadius: 5,
                              value: switchValue,
                              onChanged: onChanged
                              // (value) {
                              // setState(() {
                              //   _switchValue = value;
                              // });
                              // },
                              ),
                        ))
                    : Container(),
                customPreffixIcon == false
                    ? const SizedBox()
                    : checked == true
                        ? Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Icon(Icons.check_circle,
                                color: arrowIconColor ?? Colors.green,
                                size: 28),
                          )
                        : Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: ClipOval(
                                child: Material(
                              color: Colors.red, // button color
                              child: SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Icon(Icons.close,
                                      color: arrowIconColor ?? Colors.white,
                                      size: 20)),
                            ))),
                arrow == false
                    ? const SizedBox()
                    : Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: Icon(Icons.arrow_forward_ios,
                            color: arrowIconColor ?? AppColor.neutral,
                            size: 18.w),
                      ),
                // suffixIcon != null ? suffixIcon : SizedBox(),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
            height: 3,
          )
        ],
      ),
    );
  }
}
