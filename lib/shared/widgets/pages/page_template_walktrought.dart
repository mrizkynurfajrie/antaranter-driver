import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';

class PageTemplateWalktrought extends StatelessWidget {
  final Widget buttonChangeLanguage;
  final Widget slideIndicator;
  final Widget buttonBottom;
  final Widget child;

  const PageTemplateWalktrought({
    required this.buttonChangeLanguage,
    required this.slideIndicator,
    required this.buttonBottom,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: AppColor.whiteColor,
          child: Stack(
            children: [
              Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(child: child),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, Get.width / 9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      slideIndicator,
                      verticalSpace(30.h),
                      buttonBottom,
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 23.w, top: 14.h),
                  child: buttonChangeLanguage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
