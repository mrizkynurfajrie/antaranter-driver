import 'dart:developer';

import 'package:antaranter_driverapp/features/otp/controller_otp.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/others/countdown_timer.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PageOtp extends GetView<ControllerOtp> {
  const PageOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      title: 'OTP Verification',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 0,
      toolbarTitleColor: AppColor.neutral,
      enableBack: true,
      child: SafeArea(
        child: Obx(
          () => Column(
            children: [
              verticalSpace(Insets.xl),
              Padding(
                padding: EdgeInsets.all(
                  Insets.med,
                ),
                child: Text(
                  "Masukkan Kode OTP yang terkirim \nke nomor ponsel +62xxxxxxxx",
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(Insets.xl),
              Form(
                key: controller.formkey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      // autoDisposeControllers: false,
                      autoFocus: true,
                      mainAxisAlignment: MainAxisAlignment.center,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      validator: (_) {
                        return null;
                      
                        // print("disini "+v!);
                        // if (GetUtils.isNum(v!) == false) {
                        //   return "Only number";
                        // } else {
                        //   return null;
                        // }
                      },
                      textStyle: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s26,
                      ),
                      pinTheme: PinTheme(
                        // shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: Get.height / 13.w,
                        fieldWidth: Get.width / 8.w,
                        fieldOuterPadding: EdgeInsets.symmetric(
                          horizontal: Insets.med,
                        ),
                        activeColor: AppColor.primaryColor,
                        activeFillColor: AppColor.whiteColor,
                        selectedColor: Colors.black,
                        selectedFillColor: AppColor.whiteColor,
                        disabledColor: AppColor.bodyColor,
                        inactiveFillColor: AppColor.whiteColor,
                        inactiveColor: Colors.black,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: controller.errorController,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        log("Completed");
                      },
                      onTap: () {
                        log("Pressed");
                      },
                      onChanged: (value) {
                        log(value);
                        controller.currentText.value = value;
                      },
                    )),
              ),
              verticalSpace(Insets.lg),
              controller.showResendOtpButton.isFalse
                  ? Center(
                      child: CountDownTimer(
                        secondsRemaining:
                            controller.showResendOtpButton.isFalse ? 60 : 0,
                        whenTimeExpires: () {
                          controller.showResendOtpButton.value = true;
                        },
                        countDownTimerStyle: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s18,
                        ),
                      ),
                    )
                  : const SizedBox(),
              verticalSpace(Insets.xl),
              controller.showResendOtpButton.isTrue
                  ? Column(
                      children: [
                        Text(
                          "Tidak menerima kode OTP ?",
                          style: TextStyles.inter
                              .copyWith(color: AppColor.disableText),
                        ),
                        ButtonText(
                          onPressed: () {
                            controller.showResendOtpButton.value = false;
                          },
                          label: "Kirim ulang",
                          textStyle: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            height: 1.71,
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              verticalSpace(48.w),
              ButtonPrimary(
                onPressed: () {},
                label: "Submit",
                cornerRadius: 10,
                margin: EdgeInsets.symmetric(
                  horizontal: Insets.xl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
