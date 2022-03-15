import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/saldo/controller_saldo.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageSaldo extends GetView<ControllerSaldo> {
  const PageSaldo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'SALDO',
      toolbarTitleColor: AppColor.neutral.shade900,
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      enableBack: true,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CardPrimary(
                height: Get.height * 0.25.h,
                width: Get.width * 0.87.w,
                color: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                radius: 19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: Get.width * 0.30.w,
                          child: AppLogos.logoApp(AppLogos.logoUncoloured),
                        ),
                      ],
                    ),
                    verticalSpace(15.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: Get.width * 0.33.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'mrizkynurfajrie',
                              style: TextStyles.textTitle,
                            ),
                            Text(
                              '085250505050',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(20.h),
                    SizedBox(
                      width: Get.width * 0.5.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Rp 0,-',
                            style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s32,
                                fontWeight: FontWeight.bold,
                                color: AppColor.whiteColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonSaldo(
                      icon: AppIcons.icTopUp,
                      title: 'Isi Ulang',
                      buttonHeight: 55.h,
                      buttonWidth: 105.w,
                      ontap: () {},
                    ),
                  ],
                ),
              ),
              verticalSpace(15.h),
              CardPrimary(
                width: Get.width * 0.9.h,
                height: Get.height * 0.45.h,
                color: AppColor.whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: IconSizes.xxl,
                      width: IconSizes.xxl,
                      child: Image.asset('assets/icons/no_data.png'),
                    ),
                    verticalSpace(5.h),
                    SizedBox(
                      width: Get.width * 0.7,
                      child: Text(
                          'Anda belum memiliki transaksi, silakan lakukan isi ulang saldo',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSaldo extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;
  final double? buttonHeight;
  final double? buttonWidth;

  const ButtonSaldo({
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
