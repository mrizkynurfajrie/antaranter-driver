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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
            SizedBox(
              height: Get.height * 0.35.h,
              width: Get.width * 0.88.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InputPrimary(
                    controller: controller.cName,
                    hintText: "Nama Lengkap",
                    onTap: () {},
                    prefixIcon: null,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    margin: EdgeInsets.only(bottom: 5.h),
                  ),
                  InputPhone(
                    controller: controller.cPhoneNumber,
                    phoneNumber: (value) {},
                    // boxwidth: Get.width * 0.80.w,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding: EdgeInsets.only(bottom: 5.h),
                    inputWidth: Get.width * 0.52.w,
                  ),
                  InputPassword(
                    onChange: (value) {},
                    controller: controller.cPassword,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                  ),
                ],
              ),
            ),
            verticalSpace(5.h),
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
                      size: 250.w,
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
