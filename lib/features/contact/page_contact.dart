import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/contact/controller_contact.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageContact extends GetView<ControllerContact> {
  const PageContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarTitleColor: AppColor.primaryColor,
      center: Center(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
      ),
      toolbarElevation: 2,
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
                  'Kalian dapat menghubungi dan mengikuti AntarAnter pada layanan berikut',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(5.h),
              ButtonContact(
                ontap: () => controller.ourIg(),
                icon: AppIcons.iconApp(AppIcons.contInstagram,
                    AppColor.primaryColor, IconSizes.sm),
                title: 'Instagram',
                buttonHeight: Get.height * 0.09.h,
                buttonWidth: Get.width * 0.88.w,
              ),
              ButtonContact(
                ontap: () => controller.ourFb(),
                icon: AppIcons.iconApp(
                    AppIcons.contFacebook, AppColor.primaryColor, IconSizes.sm),
                title: 'Facebook',
              ),
              ButtonContact(
                ontap: () => controller.ourEmail(),
                icon: AppIcons.iconApp(
                    AppIcons.contEmail, AppColor.primaryColor, IconSizes.sm),
                title: 'Email',
              ),
              ButtonContact(
                ontap: () => controller.ourWeb(),
                icon: AppIcons.iconApp(
                    AppIcons.contWebsite, AppColor.primaryColor, IconSizes.sm),
                title: 'Website',
              ),
              ButtonContact(
                ontap: () async {
                  showPopUp(
                    imageUri: PopUpIcons.construction,
                    description: 'Under Construction',
                    dismissible: false,
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Get.back();
                },
                icon: AppIcons.iconApp(
                    AppIcons.contWhatsapp, AppColor.primaryColor, IconSizes.sm),
                title: 'Whatsapp',
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
  final Widget icon;
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
      child: CardRounded(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        width: buttonWidth,
        shadow: Shadows.universal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              color: AppColor.whiteColor,
              child: icon,
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
