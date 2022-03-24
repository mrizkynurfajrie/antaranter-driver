import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/contact/controller_contact.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
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
              Container(
                margin: EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                  top: 10.h,
                  bottom: 20.h,
                ),
                child: Text(
                  'Kalian dapat menghubungi dan mengikuti IN-TAKE pada layanan berikut',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ButtonContact(
                ontap: () {},
                icon: AppIcons.contWhatsapp,
                title: 'Whatsapp',
                buttonHeight: Get.height * 0.07.h,
                buttonWidth: Get.width * 0.88.w,
              ),
              verticalSpace(5.h),
              ButtonContact(
                ontap: () {},
                icon: AppIcons.contInstagram,
                title: 'Instagram',
                buttonHeight: Get.height * 0.07.h,
                buttonWidth: Get.width * 0.88.w,
              ),
              verticalSpace(5.h),
              ButtonContact(
                ontap: () {},
                icon: AppIcons.contFacebook,
                title: 'Facebook',
                buttonHeight: Get.height * 0.07.h,
                buttonWidth: Get.width * 0.88.w,
              ),
              verticalSpace(5.h),
              ButtonContact(
                ontap: () {},
                icon: AppIcons.contEmail,
                title: 'Email',
                buttonHeight: Get.height * 0.07.h,
                buttonWidth: Get.width * 0.88.w,
              ),
              verticalSpace(5.h),
              ButtonContact(
                ontap: () {},
                icon: AppIcons.contWebsite,
                title: 'Website',
                buttonHeight: Get.height * 0.07.h,
                buttonWidth: Get.width * 0.88.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonContact extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;
  final double? buttonHeight;
  final double? buttonWidth;

  const ButtonContact({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CardRoundedBorder(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
        height: buttonHeight,
        width: buttonWidth,
        shadow: Shadows.universal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              color: AppColor.whiteColor,
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            horizontalSpace(7.h),
            Text(
              title,
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
