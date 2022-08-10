import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/login/controller_login.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_password.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_phone.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(children: [
          SvgPicture.asset(
            AppIcons.circlebg,
            width: Get.width,
            color: AppColor.primaryColor,
            fit: BoxFit.fitWidth,
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Buat Logo//
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        children: [
                          Text(
                            'Masuk',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s28,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppIcons.loginbg,
                          height: 156.h,
                          width: 164.w,
                        ),
                      ],
                    ),
                  ],
                ),
                //-----//
                verticalSpace(20.h),
                Container(
                  color: AppColor.transparentColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  width: Get.width,
                  child: Column(
                    children: [
                      InputPhone(
                        controller: controller.cPhoneNumber,
                        phoneNumber: (value) {},
                        // inputWidth: Get.width * 0.50.w,
                      ),
                      InputPassword(
                        onChange: (value) {},
                        controller: controller.cPassword,
                        label: 'Password',
                        labelStyle: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s10,
                            fontWeight: FontWeight.w400),
                        hintText: 'Masukkan Kata Sandi',
                        // padding: EdgeInsets.symmetric(horizontal: 14.w),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ButtonText(
                            label: 'Lupa Password',
                            textStyle: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s10,
                                fontWeight: FontWeight.w500),
                            onPressed: () {
                              controller.ourWa();
                            },
                            color: AppColor.forgotPass,
                          ),
                        ],
                      ),
                      verticalSpace(20.h),
                      Obx(
                        () => controller.loading.isFalse
                            ? ButtonPrimary(
                                enable: controller.isValidForm.value,
                                label: 'Masuk',
                                size: 345.w,
                                height: 40.h,
                                cornerRadius: 9,
                                color: AppColor.primaryColor,
                                onPressed: () {
                                  controller.validateForm();
                                  if (controller.isValidForm.value) {
                                    controller.login();
                                  }
                                },
                              )
                            : loadingIndicatorBottom(context),
                      ),
                    ],
                  ),
                ),
                verticalSpace(20.h),
                RichText(
                  text: TextSpan(
                    text: 'Belum memiliki akun?',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.neutral,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Daftar',
                        style: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await Api2().removeRider();
                            controller.goToRegisterPage(0);
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
