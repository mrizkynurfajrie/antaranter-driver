import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary_name.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_password.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_phone.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      enableBack: false,
      resizeAvoidBottom: false,
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
              ],
            ),
            verticalSpace(25.h),
            Text(
              "Silakan daftarkan sebuah akun untuk anda",
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20.h),
            CardRounded(
              color: AppColor.bgPageColor,
              shadow: Shadows.none,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InputName(
                    label: 'Nama',
                    controller: controller.cName,
                    hintText: "Masukkan Nama Lengkap",
                    onTap: () {},
                    prefixIcon: null,
                    // padding: EdgeInsets.symmetric(horizontal: 14.w),
                  ),
                  InputPhone(
                    controller: controller.cPhoneNumber,
                    phoneNumber: (value) {},
                    // margin: EdgeInsets.symmetric(horizontal: 12.w),
                    inputWidth: Get.width * 0.54.w,
                  ),
                  InputPassword(
                    onChange: (value) {},
                    controller: controller.cPassword,
                    // padding: EdgeInsets.symmetric(horizontal: 14.w),
                    label: 'Kata Sandi',
                    hintText: 'Masukkan Kata Sandi',
                  ),
                ],
              ),
            ),
            verticalSpace(15.h),
            Obx(
              () => controller.loading.isFalse
                  ? ButtonPrimary(
                      enable: controller.isValidForm.value,
                      label: 'Daftar',
                      color: AppColor.primaryColor,
                      onPressed: () {
                        controller.validateForm();
                        if (controller.isValidForm.value) {
                          controller.register();
                        }
                        // Get.toNamed('/regsuccess_page');
                      },
                      size: 290.w,
                      cornerRadius: 9,
                    )
                  : loadingIndicatorBottom(context),
            ),
          ],
        ),
      ),
    );
  }
}
