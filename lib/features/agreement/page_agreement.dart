import 'package:antaranter_driverapp/features/agreement/controller_agreement.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/checkbox_label.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageAgreement extends GetView<ControllerAgreement> {
  const PageAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 0,
      backgroundColor: AppColor.bgPageColor,
      center: AppLogosMed.logoApp(AppLogos.logoHorizontal),
      enableBack: false,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Surat Perjanjian Kerjasama Sebagai Mitra Driver Aplikasi ',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.neutral,
                      ),
                    ),
                    TextSpan(
                      text: 'AntarAnter',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Silakan membaca surat perjanjian berikut dengan baik dan seksama :',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.neutral,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(15.h),
              CardRoundedBorder(
                width: Get.width,
                height: Get.height * 0.55.h,
                borderWidth: 2,
                borderColor: AppColor.greyColorLight,
                borderRadius: 4,
                color: AppColor.bgPageColor,
                child: Obx(() => controller.loading.isFalse
                    ? Scrollbar(
                        child: ListView(
                          children: [
                            Html(
                              data: controller.agreement.value.skDesc!,
                            ),
                          ],
                        ),
                      )
                    : loadingIndicatorBottom(context)),
              ),
              verticalSpace(5.h),
               Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: CheckboxLabel(
                  onChange: (value) {
                    controller.statusAgreement.value = value;
                  },
                  label:
                      'Saya telah membaca dan menyetujui Surat Perjanjian Kerjasama sebagai Mitra Driver Aplikasi AntarAnter diatas',
                  colorBorder: AppColor.greyColorLight,
                  labelStyle: TextStyles.textcheckbox,
                  width: Get.width * 0.75.w,
                ),
              ),
              Obx(
                () => Padding(
                  padding:  EdgeInsets.symmetric(vertical: 15.h),
                  child: ButtonPrimary(
                    enable: controller.statusAgreement.value,
                    label: 'Konfirmasi',
                    color: AppColor.primaryColor,
                    cornerRadius: 9,
                    onPressed: () async {
                      Get.offAllNamed(Routes.main, arguments: 1);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}