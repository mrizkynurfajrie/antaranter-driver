import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/checkbox_label.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageTerms extends GetView<ControllerRegister> {
  const PageTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      enableBack: false,
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      center: Row(
        children: [
          AppLogosMed.logoApp(AppLogosMed.logoOnly),
          horizontalSpace(5.w),
          Text(
            "AntarAnter",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: FontSizes.s14,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            verticalSpace(15.h),
            Text(
              "Selamat datang",
              style: TextStyles.textHeader,
              textAlign: TextAlign.center,
            ),
            verticalSpace(10.h),
            SizedBox(
              width: Get.width * 0.88.w,
              child: Text(
                "Mohon perhatikan dan pahami ketentuan berikut untuk dapat menjadi mitra `Lorem Ipsum` Driver",
                style: TextStyles.textStd,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            verticalSpace(10.h),
            CardRoundedBorder(
              padding: EdgeInsets.only(left: 3.w, right: 5.w),
              borderColor: AppColor.greyColorLight,
              height: Get.height * 0.57.h,
              width: Get.width * 0.8.w,
              child: const SizedBox(),
            ),
            verticalSpace(10.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CheckboxLabel(
                onChange: (value) {
                  controller.statusAgreementTerm.value = value;
                },
                label:
                    'Saya mengerti dan memahami dengan syarat serta ketentuan yang berlaku',
                colorBorder: AppColor.greyColorLight,
                labelStyle: TextStyles.textcheckbox,
              ),
            ),
            verticalSpace(10.h),
            Obx(
              () => ButtonPrimary(
                enable: controller.statusAgreementTerm.value,
                label: 'Konfirmasi',
                color: AppColor.primaryColor,
                cornerRadius: 9,
                onPressed: () {
                  Get.toNamed('/register_page');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
