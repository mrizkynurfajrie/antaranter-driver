import 'package:flutter/material.dart';
import 'package:intake_rider/features/register/controller_register.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_password.dart';
import 'package:intake_rider/shared/widgets/inputs/input_phone.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageRegister extends GetView<ControllerRegister> {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AppLogos.logoApp(AppLogos.logoColoured),
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
              InputPhone(
                controller: controller.cPhoneNumber,
                phoneNumber: (value) {},
              ),
              InputPassword(
                onChange: (value) {},
                controller: controller.cPassword,
              ),
              verticalSpace(20.h),
              ButtonPrimary(
                label: 'Daftar',
                color: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed('/regsuccess_page');
                },
                size: 350.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
