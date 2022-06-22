import 'dart:developer';

import 'package:antaranter_driverapp/response/nebeng_posting.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/input_format/input_format_money.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:antaranter_driverapp/shared/widgets/others/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_time.dart';
import 'controller_nebeng_posting.dart';

class PageNebengPosting extends GetView<ControllerNebengPosting> {
  const PageNebengPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: CardRounded(
          color: AppColor.bgPageColor,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          shadow: Shadows.none,
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                controller.isUrgent.value == 0
                    ? controller.isUrgentCanceled.value == 0
                        ? CardRounded(
                            color: AppColor.whiteColor,
                            borderRadius: 0,
                            shadow: Shadows.none,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            margin: EdgeInsets.only(
                                top: Insets.sm,
                                right: Insets.sm,
                                left: Insets.sm),
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apakah anda ingin melakukan perjalanan yang bersifat mendesak?',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                AnimatedToggle(
                                    values: const ['Tidak', 'Ya'],
                                    onToggleCallback: (value) {
                                      if (value == 0) {
                                        var togglefalse =
                                            controller.isUrgent.value == 1;
                                        log('togglefalse : ' +
                                            togglefalse.toString());
                                      } else {
                                        var toggletrue =
                                            controller.isUrgent.value == 0;
                                        log('toggletrue : ' +
                                            toggletrue.toString());
                                        showPopUpChoice(
                                            dismissible: false,
                                            title: 'Perjalanan Mendesak',
                                            description:
                                                'Apakah anda yakin ingin melakukan perjalanan mendesak? Dengan mengaktifkan fitur ini anda akan diberikan kemampuan membagikan perjalanan untuk di hari ini juga dengan ketentuan harga yang berbeda',
                                            labelPositif: 'Ya',
                                            labelNegatif: 'Batal',
                                            onCancel: () {
                                              controller.isUrgent.value = 0;
                                              controller
                                                  .isUrgentCanceled.value = 1;
                                              Get.back();
                                            },
                                            onConfirm: () {
                                              controller.isUrgent.value = 1;
                                              log('isurgent : ' +
                                                  controller.isUrgent.value
                                                      .toString());
                                              Get.back();
                                            });
                                      }
                                    })
                              ],
                            ),
                          )
                        : const SizedBox()
                    : const SizedBox(),
                CardRounded(
                  width: Get.width,
                  borderRadius: 0,
                  shadow: Shadows.none,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          'Informasi Kendaraan*',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(Insets.sm),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.disbaleBox,
                              border:
                                  Border.all(color: AppColor.greyColorLight),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              controller.controllerVehicleInfo.vehicle.value
                                      .vehicleVariant ??
                                  '',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.disableText,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          verticalSpace(Insets.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    color: AppColor.disbaleBox,
                                    border: Border.all(
                                        color: AppColor.greyColorLight),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    controller.controllerVehicleInfo.vehicle
                                            .value.vehicleColor ??
                                        '',
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s12,
                                      color: AppColor.disableText,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpace(Insets.sm),
                              Expanded(
                                child: Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    color: AppColor.disbaleBox,
                                    border: Border.all(
                                        color: AppColor.greyColorLight),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    controller.controllerVehicleInfo.vehicle
                                            .value.platNumber ??
                                        '',
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s12,
                                      color: AppColor.disableText,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CardRounded(
                  borderRadius: 0,
                  width: Get.width,
                  shadow: Shadows.none,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          'Perjalanan*',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(Insets.med),
                      //berangkat//
                      Text(
                        'Berangkat',
                        style: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s12,
                          color: AppColor.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(5.h),
                      SizedBox(
                        width: Get.width,
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InputSelectionNebeng(
                                valueText: controller.itemCitiesDept.value != ''
                                    ? controller.itemCitiesDept.value
                                    : 'Kota/Kabupaten',
                                hintText: 'select_cities'.tr,
                                onTap: () async {
                                  controller.buildCities(context);
                                  // if (controller
                                  //     .idProvince.value == null) {
                                  //   controller.buildCities(context);
                                  // } else {
                                  //   showPopUp(
                                  //     title: 'Perhatian',
                                  //     description:
                                  //         'Pilih provinsi terlebih dahulu untuk dapat memilih kota',
                                  //     imageUri: PopUpIcons.information,
                                  //   );
                                  //   await Future.delayed(
                                  //       const Duration(seconds: 2));
                                  //   Navigator.pop(context);
                                  // }
                                },
                                padding: EdgeInsets.all(Insets.sm),
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: Get.width,
                                isRequired: false,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => InputDate(
                                      hintText: 'DD/MM/YYYY',
                                      controller: controller.txtDateDept,
                                      selectedDate: (value) {},
                                      isValid: (value) {},
                                      suffixIcon: const Icon(
                                        Icons.date_range,
                                        color: AppColor.greyColor,
                                        size: 20,
                                      ),
                                      boxWidth: 130.w,
                                      initialDate:
                                          controller.isUrgent.value == 1
                                              ? DateTime.now()
                                              : DateTime(
                                                  controller.now.year,
                                                  controller.now.month,
                                                  controller.now.day + 1,
                                                ),
                                      firstDate: controller.isUrgent.value == 1
                                          ? DateTime.now()
                                          : DateTime(
                                              controller.now.year,
                                              controller.now.month,
                                              controller.now.day + 1,
                                            ),
                                      lastDate: controller.isUrgent.value == 1
                                          ? DateTime.now()
                                          : DateTime(2030),
                                    ),
                                  ),
                                  horizontalSpace(5.w),
                                  InputTime(
                                      hintText: '00.00',
                                      controller: controller.txtTimeDept,
                                      selectedTime: (value) {},
                                      isValid: (value) {},
                                      suffixIcon: const Icon(
                                        Icons.access_time_outlined,
                                        size: 20,
                                        color: AppColor.greyColor,
                                      ),
                                      boxWidth: 110.w),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(Insets.med),
                      //tujuan//
                      Text(
                        'Tujuan',
                        style: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s12,
                          color: AppColor.neutral.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(10.h),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InputSelectionNebeng(
                              valueText: controller.itemCitiesArrv.value != ''
                                  ? controller.itemCitiesArrv.value
                                  : 'Kota/Kabupaten',
                              hintText: 'select_cities'.tr,
                              onTap: () {
                                controller.buildCitiesArrv(context);
                              },
                              padding: EdgeInsets.all(Insets.sm),
                              margin: EdgeInsets.only(bottom: 5.h),
                              width: Get.width,
                              isRequired: false,
                            ),
                            Row(
                              children: [
                                InputDate(
                                  hintText: 'DD/MM/YYYY',
                                  controller: controller.txtDateArrv,
                                  selectedDate: (value) {},
                                  isValid: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.date_range,
                                    color: AppColor.greyColor,
                                    size: 20,
                                  ),
                                  boxWidth: 130.w,
                                  initialDate: controller.isUrgent.value == 1
                                      ? DateTime(
                                          controller.now.year,
                                          controller.now.month,
                                          controller.now.day)
                                      : DateTime(
                                          controller.now.year,
                                          controller.now.month,
                                          controller.now.day + 1,
                                        ),
                                  firstDate: controller.isUrgent.value == 1
                                      ? DateTime(
                                          controller.now.year,
                                          controller.now.month,
                                          controller.now.day)
                                      : DateTime(
                                          controller.now.year,
                                          controller.now.month,
                                          controller.now.day + 1,
                                        ),
                                ),
                                horizontalSpace(5.w),
                                InputTime(
                                  hintText: '00.00',
                                  controller: controller.txtTimeArrv,
                                  selectedTime: (value) {},
                                  isValid: (value) {},
                                  suffixIcon: const Icon(
                                    Icons.access_time,
                                    size: 20,
                                    color: AppColor.greyColor,
                                  ),
                                  boxWidth: 110.w,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(Insets.sm),
                CardRounded(
                  borderRadius: 0,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Harga',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s12,
                                  color: AppColor.neutral.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              verticalSpace(5.h),
                              InputPrimary(
                                boxWidth: 120.w,
                                hintText: 'Rp 0',
                                onTap: () {},
                                onChange: (value) async {
                                  var priceformatted = controller.txtPrice.text
                                      .replaceAll(RegExp('[^A-Za-z0-9]'), '');
                                  var perc =
                                      int.parse(priceformatted) * 13.45 / 100;
                                  var calc = controller.currentBalance /
                                      double.tryParse(perc.toString())!;
                                  controller.countSeat.value =
                                      double.tryParse(calc.toString())!.floor();

                                  controller.listSeat.clear();

                                  log('count seat : ' +
                                      controller.countSeat.toString());

                                  if (controller.countSeat.value <= 5) {
                                    for (var i = 1;
                                        i <= controller.countSeat.value;
                                        i++) {
                                      controller.listSeat.add(i);
                                      log('list seat : ' +
                                          controller.listSeat.toString());
                                    }
                                  } else {
                                    if (controller.countSeat.value == 0) {
                                      return showPopUp(
                                          title: 'Saldo Kurang',
                                          description:
                                              'Saldo anda tidak mencukupi untuk melakukan perjalanan dengan harga tersebut.');
                                    } else {
                                      for (var i = 1; i <= 5; i++) {
                                        controller.listSeat.add(i);
                                      }
                                    }
                                  }
                                },
                                inputFormatters: [
                                  // controller.maskFormatter,
                                  LengthLimitingTextInputFormatter(7),
                                  ThousandsSeparatorInputFormatter(),
                                ],
                                keyboardType: TextInputType.number,
                                controller: controller.txtPrice,
                              ),
                            ],
                          ),
                          horizontalSpace(20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kursi Penumpang',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s12,
                                  color: AppColor.neutral.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              verticalSpace(5.h),
                              CardRoundedBorder(
                                width: 130.w,
                                borderWidth: 1,
                                shadow: Shadows.none,
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 0.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CardRounded(
                                      width: 60.w,
                                      shadow: Shadows.none,
                                      color: AppColor.whiteColor,
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.zero,
                                      child: Obx(
                                        () => DropdownButtonFormField<String>(
                                          elevation: 1,
                                          hint: Text(
                                            controller.countSeat.value < 1
                                                ? 'Saldo Tidak Cukup'
                                                : '0',
                                            style: controller.countSeat.value <=
                                                    0
                                                ? TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s12,
                                                    color: AppColor.errorColor,
                                                    fontWeight: FontWeight.w400)
                                                : TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s12,
                                                    color:
                                                        AppColor.greyColorLight,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                          ),
                                          style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s12,
                                              fontWeight: FontWeight.normal,
                                              color: AppColor.neutral),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (newValue) {
                                            controller.dropDownValue.value =
                                                newValue.toString();
                                            controller.update();
                                          },
                                          value: controller.dropDownValue
                                              .toString(),
                                          items: [
                                            for (var data
                                                in controller.listSeat)
                                              DropdownMenuItem(
                                                child: Text(
                                                  data.toString(),
                                                ),
                                                value: data.toString(),
                                              )
                                          ],
                                          isExpanded: true,
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(10.w),
                                    Text(
                                      'kursi',
                                      style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.greyColorLight),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Obx(
                          //   () => SizedBox(
                          //     width: Get.width * 0.88.w,
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Ketersediaan Tempat Duduk',
                          //           style: TextStyles.inter.copyWith(
                          //             fontSize: FontSizes.s12,
                          //             color: AppColor.neutral,
                          //             fontWeight: FontWeight.w400,
                          //           ),
                          //         ),
                          //         GestureDetector(
                          //           onTap: () {
                          //             controller.buildavailSeat();
                          //           },
                          //           child: CardRounded(
                          //             width: Get.width * 0.88.w,
                          //             margin: EdgeInsets.only(
                          //               top: 2.h,
                          //               bottom: 4.h,
                          //               left: 2.w,
                          //               right: 2.w,
                          //             ),
                          //             borderRadius: 6,
                          //             shadow: Shadows.universal,
                          //             child: Row(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Text(
                          //                   (controller.availSeat.value == '')
                          //                       ? "-Pilih"
                          //                       : controller.availSeat.value,
                          //                   style: TextStyles.inter.copyWith(
                          //                     fontSize: FontSizes.s12,
                          //                     fontWeight: FontWeight.w400,
                          //                   ),
                          //                 ),
                          //                 Icon(
                          //                   Icons.keyboard_arrow_down,
                          //                   size: IconSizes.sm,
                          //                   color: AppColor.bodyColor.shade600,
                          //                 )
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                CardRounded(
                  color: AppColor.bgPageColor,
                  shadow: Shadows.none,
                  // padding: EdgeInsets.zero,
                  // margin: EdgeInsets.zero,
                  child: ButtonPrimary(
                    enable: controller.isValidForm.value,
                    onPressed: () {
                      controller.validateForm();
                      if (controller.isValidForm.value) {
                        controller.popupDesc();
                      }
                    },
                    label: 'Bagikan',
                    color: AppColor.primaryColor,
                    cornerRadius: 7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputSelectionNebeng extends GetView<ControllerNebengPosting> {
  final String label;
  final String hintText;
  final Function onTap;
  final String valueText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffixLabel;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final bool isRequired;
  final bool isValid;
  final NebengPosting? nebengPost;

  const InputSelectionNebeng(
      {Key? key,
      this.label = '',
      required this.valueText,
      required this.onTap,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixLabel,
      this.padding,
      this.margin,
      this.width,
      this.height,
      required this.isRequired,
      this.isValid = true,
      this.nebengPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              onTap();
            },
            child: Container(
              width: width,
              height: height,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: Corners.lgBorder,
                border: isRequired
                    ? isValid
                        ? Border.all(
                            width: Strokes.xthin,
                            color: AppColor.bodyColor.shade300,
                          )
                        : Border.all(
                            width: Strokes.thin,
                            color: AppColor.errorColor,
                          )
                    : Border.all(
                        width: Strokes.xthin,
                        color: AppColor.bodyColor.shade300,
                      ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: Insets.med),
                      child: prefixIcon!,
                    )
                  else
                    const SizedBox(),
                  Expanded(
                    child: Text(
                      valueText,
                      style: valueText == 'Kota/Kabupaten'
                          ? TextStyles.inter.copyWith(
                              fontSize: FontSizes.s12,
                              color: AppColor.disableText,
                              fontWeight: FontWeight.normal)
                          : TextStyles.inter.copyWith(
                              color: AppColor.neutral,
                              fontSize: FontSizes.s12,
                              fontWeight: FontWeight.normal,
                            ),
                    ),
                  ),
                  // const Spacer(),
                  suffixIcon ??
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: IconSizes.med,
                        color: AppColor.bodyColor.shade600,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
