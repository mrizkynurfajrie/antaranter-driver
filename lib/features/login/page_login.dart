import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/login/controller_login.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_password.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_phone.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      resizeAvoidBottom: false,
      enableBack: false,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Buat Logo//
            Column(
              children: [
                AppLogos.logoApp(AppLogos.logoHorizontal),
                verticalSpace(5.h),
              ],
            ),
            //-----//
            verticalSpace(40.h),
            SizedBox(
              height: Get.height * 0.35.h,
              width: Get.width * 0.88.w,
              child: Column(
                children: [
                  InputPhone(
                    controller: controller.cPhoneNumber,
                    phoneNumber: (value) {},
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding: EdgeInsets.only(bottom: 5.h),
                    inputWidth: Get.width * 0.52.w,
                  ),
                  InputPassword(
                    onChange: (value) {},
                    controller: controller.cPassword,
                    label: 'Kata Sandi',
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                  ),
                ],
              ),
            ),
            verticalSpace(15.h),
            Obx(
              () => controller.loading.isFalse
                  ? ButtonPrimary(
                      enable: controller.isValidForm.value,
                      label: 'Masuk',
                      cornerRadius: 9,
                      color: AppColor.primaryColor,
                      onPressed: () {
                        controller.validateForm();
                        if (controller.isValidForm.value) {
                          controller.login();
                        }
                      },
                      size: 250.w,
                    )
                  : loadingIndicatorBottom(context),
            ),
            verticalSpace(10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 17,
                  child: Text('Belum punya akun? yuk'),
                ),
                ButtonText(
                  label: 'Daftar',
                  onPressed: () {
                    Get.toNamed('/terms_page');
                  },
                  color: AppColor.primary.shade900,
                ),
                const SizedBox(
                  height: 17,
                  child: Text('dulu.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
