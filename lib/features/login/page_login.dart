import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
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
            CardRounded(
              color: AppColor.bgPageColor,
              shadow: Shadows.none,
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
                    label: 'Kata Sandi',
                    hintText: 'Masukkan Kata Sandi',
                    // padding: EdgeInsets.symmetric(horizontal: 14.w),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ButtonText(
                        label: 'Lupa Kata Sandi?',
                        textStyle: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            fontWeight: FontWeight.w500),
                        onPressed: () async {
                          showPopUp(
                            title: 'Lupa Kata Sandi',
                            description: 'Silakan hubungi admin AntarAnter untuk mengatur kembali kata sandi anda',
                            imageUri: PopUpIcons.information,
                            dismissible: false,
                          );
                          await Future.delayed(const Duration(seconds: 4));
                          Navigator.pop(context);
                          // Get.toNamed(Routes.otp);
                        },
                        color: AppColor.forgotPass,
                      ),
                    ],
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
                          )
                        : loadingIndicatorBottom(context),
                  ),
                ],
              ),
            ),

            verticalSpace(40.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 17,
                  child: Text('----------'),
                ),
                ButtonText(
                  label: ' Daftar disini ',
                  onPressed: () {
                    Get.toNamed('/terms_page');
                  },
                  color: AppColor.primary.shade900,
                ),
                const SizedBox(
                  height: 17,
                  child: Text('----------'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
