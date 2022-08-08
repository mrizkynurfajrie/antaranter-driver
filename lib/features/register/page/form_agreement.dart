import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/checkbox_label.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormAgreement extends GetView<ControllerRegister> {
  const FormAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
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
                  SizedBox(
                    width: Get.width,
                    child: RichText(
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
                  ),
                  verticalSpace(15.h),
                  Expanded(
                    child: CardRoundedBorder(
                      borderWidth: 2,
                      borderColor: AppColor.greyColorLight,
                      borderRadius: 4,
                      color: AppColor.whiteColor,
                      child: Obx(() => controller.loading.isFalse
                          ? Scrollbar(
                              child: ListView(
                                children: [
                                  Html(
                                    data: controller.agreementData.value.skDesc!,
                                  ),
                                ],
                              ),
                            )
                          : loadingIndicatorBottom(context)),
                    ),
                  ),
                  verticalSpace(5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                    child: CheckboxLabel(
                      onChange: (value) {
                        controller.statusCheck.value = value;
                        controller.statusAgreement.value = 1;
                      },
                      label:
                          'Saya telah membaca dan menyetujui Surat Perjanjian Kerjasama tersebut diatas',
                      colorBorder: AppColor.greyColorLight,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
