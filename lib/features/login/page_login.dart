import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/login/controller_login.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_text.dart';
import 'package:intake_rider/shared/widgets/inputs/input_password.dart';
import 'package:intake_rider/shared/widgets/inputs/input_phone.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/others/loading_indicator.dart';

class PageLogin extends GetView<ControllerLogin> {
  const PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.bodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/logo/logo-besar.png",
                width: Get.width * 0.65.w,
              ),
              verticalSpace(45.h),
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
                        color: AppColor.primaryColor,
                        onPressed: () {
                          controller.validateForm();
                          if (controller.isValidForm.value) {
                            controller.login();
                          }
                        },
                        size: 250,
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
      ),
    );
  }
}
