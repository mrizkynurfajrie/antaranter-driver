import 'dart:developer';

import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_password.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_phone.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormRegisterUser extends GetView<ControllerRegister> {
  const FormRegisterUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SvgPicture.asset(
              AppIcons.circlebg,
              width: Get.width,
              color: AppColor.primaryColor,
              fit: BoxFit.fitWidth,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      children: [
                        // Text(
                        //   'Daftar',
                        //   style: TextStyles.inter.copyWith(
                        //     fontSize: FontSizes.s28,
                        //     fontWeight: FontWeight.bold,
                        //     color: AppColor.primaryColor,
                        //   ),
                        // ),
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
                  verticalSpace(20.h),
                  Column(
                    children: [
                      Container(
                        color: AppColor.transparentColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InputNameReg(
                              margin: EdgeInsets.zero,
                              label: 'Nama',
                              controller: controller.txtName,
                              hintText: "Masukkan Nama Lengkap",
                              onTap: () {},
                              prefixIcon: null,
                              // padding: EdgeInsets.symmetric(horizontal: 14.w),
                            ),
                            InputPhone(
                              margin: EdgeInsets.zero,
                              controller: controller.cPhoneNumber,
                              phoneNumber: (value) {},
                              // inputWidth: Get.width * 0.57.w,
                            ),
                            InputPassword(
                              onChange: (value) {},
                              controller: controller.cPassword,
                              // padding: EdgeInsets.symmetric(horizontal: 14.w),
                              label: 'Kata Sandi',
                              hintText: 'Masukkan Kata Sandi',
                            ),
                            verticalSpace(25.h),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(vertical: 5.h),
                            //   child: CheckboxLabel(
                            //     onChange: (value) {
                            //       controller.statusAgreementTerm.value = value;
                            //     },
                            //     label: 'Saya menyetujui',
                            //     colorBorder: AppColor.greyColorLight,
                            //     labelStyle: TextStyles.textcheckbox,
                            //   ),
                            // ),
                            Obx(
                              () => Container(
                                margin: EdgeInsets.zero,
                                width: Get.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 0.h),
                                      width: 14.w,
                                      height: 14.h,
                                      child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        value: controller.isCheck.value,
                                        activeColor: AppColor.primaryColor,
                                        onChanged: (value) {
                                          if (controller.isCheck.value ==
                                              false) {
                                            controller.isCheck.value = true;
                                            log('check value : ' +
                                                controller.isCheck.value
                                                    .toString());
                                          } else {
                                            controller.isCheck.value = false;
                                          }
                                          controller.statusAgreementTerm.value =
                                              value!;
                                        },
                                      ),
                                    ),
                                    horizontalSpace(7.w),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'Saya menyetujui',
                                            style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s11,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.neutral,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                      ' Syarat dan Ketentuan ',
                                                  style: TextStyles.inter
                                                      .copyWith(
                                                    fontSize: FontSizes.s11,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () =>
                                                            Get.toNamed(
                                                                Routes.terms)),
                                              const TextSpan(
                                                  text:
                                                      'dari Aplikasi AntarAnter.'),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            verticalSpace(10.h),
                            // Obx(
                            //   () => controller.loading.isFalse
                            //       ? ButtonPrimary(
                            //           enable: controller.isValidForm.value &&
                            //               controller.isCheck.value == true,
                            //           label: 'Daftar',
                            //           color: AppColor.primaryColor,
                            //           onPressed: () {
                            //             controller.validateForm();
                            //             if (controller.isValidForm.value) {
                            //               controller.register();
                            //             }
                            //             // Get.toNamed('/regsuccess_page');
                            //           },
                            //           size: 345.w,
                            //           height: 40.h,
                            //           cornerRadius: 8,
                            //         )
                            //       : loadingIndicatorBottom(context),
                            // ),
                          ],
                        ),
                      ),
                      verticalSpace(20.h),
                      RichText(
                        text: TextSpan(
                          text: 'sudah memiliki akun?',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.neutral,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Masuk',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(Routes.login),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputNameReg extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function() onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final bool? enable;
  final dynamic maxLines;
  final dynamic maxLenght;
  final String? initialValue;
  final double? boxWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const InputNameReg({
    Key? key,
    required this.hintText,
    this.validate,
    required this.onTap,
    required this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.enable = true,
    this.maxLines = 1,
    this.maxLenght,
    this.initialValue,
    this.boxWidth,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  _InputNameRegState createState() => _InputNameRegState();
}

class _InputNameRegState extends State<InputNameReg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != ''
            ? SizedBox(
                child: Text(
                  widget.label,
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s10,
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral,
                  ),
                ),
              )
            : verticalSpace(0),
        Container(
          padding: widget.padding ?? EdgeInsets.zero,
          margin: widget.margin ?? EdgeInsets.zero,
          width: widget.boxWidth,
          child: TextFormField(
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            maxLength: widget.maxLenght,
            enabled: widget.enable,
            enableInteractiveSelection: true,
            cursorColor: Theme.of(context).primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            obscureText: widget.obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: (value) {
              if (!isValidName(name: value.toString())) {
                return '- Nama minimal 3 karakter';
              }
            },
            style: TextStyles.inter
                .copyWith(fontSize: FontSizes.s18, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
              suffixIcon: widget.suffixIcon,
              hintText: 'Masukkan Nama',
              hintStyle: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14, fontStyle: FontStyle.italic),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColor.neutral.shade200, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
