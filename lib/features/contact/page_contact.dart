import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/contact/controller_contact.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageContact extends GetView<ControllerContact> {
  const PageContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'INTAKE',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      center: Center(child: AppLogos.logoApp(AppLogos.logoUncoloured)),
      enableBack: true,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardPrimary(
                  height: Get.height * 0.20.h,
                  width: Get.width * 0.88.w,
                  child: Text('tes'))
            ],
          ),
        ),
      ),
    );
  }
}
