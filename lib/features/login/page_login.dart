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
                Image.asset(
                  "assets/logo/logo_only.png",
                  width: Get.width * 0.25.w,
                ),
                verticalSpace(5.h),
                Text(
                  "AntarAnter",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: FontSizes.s16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            //-----//
            verticalSpace(40.h),
            InputPhone(
              controller: controller.cPhoneNumber,
              phoneNumber: (value) {},
            ),
            InputPassword(
              onChange: (value) {},
              controller: controller.cPassword,
              label: 'Kata Sandi',
              boxWidth: Get.width * 0.88.w,
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
