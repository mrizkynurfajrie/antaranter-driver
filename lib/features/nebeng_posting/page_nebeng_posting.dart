import 'dart:developer';

import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_switch.dart';
import 'package:antaranter_driverapp/shared/widgets/input_format/input_format_money.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:antaranter_driverapp/shared/widgets/others/toggle_switch.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:antaranter_driverapp/shared/widgets/inputs/input_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_time.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'controller_nebeng_posting.dart';

class PageNebengPosting extends GetView<ControllerNebengPosting> {
  const PageNebengPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      toolbarColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgPageColor,
      toolbarElevation: 2,
      enableBack: true,
      toolbarTitleColor: AppColor.primaryColor,
      center: Center(child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal)),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => CardRounded(
              color: AppColor.bgPageColor,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  controller.isUrgent.value == false
                      ? controller.isUrgentCanceled.value == false
                          ? CardRounded(
                              color: AppColor.whiteColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              margin:
                                  EdgeInsets.symmetric(horizontal: Insets.sm),
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
                                              controller.isUrgent.value == true;
                                          log('togglefalse : ' +
                                              togglefalse.toString());
                                        } else {
                                          var toggletrue =
                                              controller.isUrgent.value ==
                                                  false;
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
                                                controller.isUrgent.value =
                                                    false;
                                                controller.isUrgentCanceled
                                                    .value = true;
                                                Get.back();
                                              },
                                              onConfirm: () {
                                                controller.isUrgent.value =
                                                    true;
                                                Get.back();
                                              });
                                        }
                                      })
                                ],
                              ),
                            )
                          : const SizedBox()
                      : const SizedBox(),
                  verticalSpace(Insets.med),
                  CardRounded(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            'Informasi Kendaraan',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        verticalSpace(Insets.sm),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              width: Get.width * 0.30,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.greyColorLight),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.car_detailed,
                                    color: AppColor.primaryColor,
                                    size: IconSizes.sm,
                                  ),
                                  horizontalSpace(10.w),
                                  Flexible(
                                    child: Text(
                                      controller.controllerVehicleInfo.vehicle
                                              .value.vehicleVariant ??
                                          '',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        color: AppColor.greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width * 0.25.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.greyColorLight),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.color_filter,
                                    color: AppColor.primaryColor,
                                    size: IconSizes.sm,
                                  ),
                                  horizontalSpace(3.w),
                                  Flexible(
                                    child: Text(
                                      controller.controllerVehicleInfo.vehicle
                                              .value.vehicleColor ??
                                          '',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        color: AppColor.greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width * 0.27.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.greyColorLight),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.numbers,
                                    color: AppColor.primaryColor,
                                    size: IconSizes.sm,
                                  ),
                                  horizontalSpace(3.w),
                                  Flexible(
                                    child: Text(
                                      controller.controllerVehicleInfo.vehicle
                                              .value.platNumber ??
                                          '',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        color: AppColor.greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(5),
                      ],
                    ),
                  ),
                  verticalSpace(Insets.med),
                  CardRounded(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            'Perjalanan',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        verticalSpace(Insets.med),
                        //berangkat//
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.my_location_rounded,
                              size: IconSizes.sm,
                              color: AppColor.greyColor,
                            ),
                            horizontalSpace(5.w),
                            Text(
                              'Berangkat',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.greyColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(5.h),
                        SizedBox(
                          width: Get.width,
                          child: Obx(
                            () => Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InputSelection(
                                  valueText: controller.itemProvinceDept.value,
                                  hintText: 'select_province'.tr,
                                  onTap: () async {
                                    controller.buildProvince(context);
                                    controller.cities.clear();
                                  },
                                  padding: EdgeInsets.all(Insets.sm),
                                  width: Get.width * 0.65.w,
                                  margin: EdgeInsets.only(bottom: 5.h),
                                ),
                                InputSelection(
                                  valueText: controller.itemCitiesDept.value,
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
                                  width: Get.width * 0.65.w,
                                ),
                                Obx(
                                  () => InputDate(
                                    hintText: 'Pilih Tanggal Berangkat',
                                    controller: controller.txtDateDept,
                                    selectedDate: (value) {},
                                    isValid: (value) {},
                                    prefixIcon: const Icon(
                                      Icons.date_range,
                                      color: AppColor.greyColor,
                                      size: 20,
                                    ),
                                    boxWidth: Get.width * 0.65.w,
                                    initialDate:
                                        controller.isUrgent.value == true
                                            ? DateTime.now()
                                            : DateTime(
                                                controller.now.year,
                                                controller.now.month,
                                                controller.now.day + 1,
                                              ),
                                    firstDate: controller.isUrgent.value == true
                                        ? DateTime.now()
                                        : DateTime(
                                            controller.now.year,
                                            controller.now.month,
                                            controller.now.day + 1,
                                          ),
                                    lastDate: controller.isUrgent.value == true
                                        ? DateTime.now()
                                        : DateTime(2030),
                                  ),
                                ),
                                verticalSpace(5.h),
                                InputTime(
                                  hintText: 'Pilih Waktu Berangkat',
                                  controller: controller.txtTimeDept,
                                  selectedTime: (value) {},
                                  isValid: (value) {},
                                  prefixIcon: const Icon(
                                    Icons.access_time_outlined,
                                    size: 20,
                                    color: AppColor.greyColor,
                                  ),
                                  boxWidth: Get.width * 0.65.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(Insets.med),
                        //tujuan//
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.my_location_rounded,
                              size: IconSizes.sm,
                              color: AppColor.primaryColor,
                            ),
                            horizontalSpace(5.w),
                            Text(
                              'Tujuan',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.neutral.shade500,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10.h),
                        SizedBox(
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InputSelection(
                                valueText: controller.itemCitiesArrv.value,
                                hintText: 'select_cities'.tr,
                                onTap: () {
                                  controller.buildCitiesArrv(context);
                                },
                                padding: EdgeInsets.all(Insets.sm),
                                margin: EdgeInsets.only(bottom: 5.h),
                                width: Get.width * 0.65.w,
                              ),
                              InputDate(
                                hintText: 'Pilih Tanggal Tiba',
                                controller: controller.txtDateArrv,
                                selectedDate: (value) {},
                                isValid: (value) {},
                                prefixIcon: const Icon(
                                  Icons.date_range,
                                  color: AppColor.primaryColor,
                                  size: 20,
                                ),
                                boxWidth: Get.width * 0.65.w,
                                initialDate: controller.isUrgent.value == true
                                    ? DateTime(
                                        controller.now.year,
                                        controller.now.month,
                                        controller.now.day)
                                    : DateTime(
                                        controller.now.year,
                                        controller.now.month,
                                        controller.now.day + 1,
                                      ),
                                firstDate: controller.isUrgent.value == true
                                    ? DateTime(controller.now.year)
                                    : DateTime(
                                        controller.now.year,
                                        controller.now.month,
                                        controller.now.day + 1,
                                      ),
                              ),
                              verticalSpace(5.h),
                              InputTime(
                                hintText: 'Pilih Waktu Tiba',
                                controller: controller.txtTimeArrv,
                                selectedTime: (value) {},
                                isValid: (value) {},
                                prefixIcon: const Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: AppColor.primaryColor,
                                ),
                                boxWidth: Get.width * 0.65.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(Insets.med),
                  CardRounded(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InputPrimary(
                          hintText: 'Harga Perjalanan',
                          onTap: () {},
                          prefixIcon: const Icon(Icons.confirmation_number),
                          inputFormatters: [
                            // controller.maskFormatter,
                            LengthLimitingTextInputFormatter(7),
                            ThousandsSeparatorInputFormatter(),
                          ],
                          keyboardType: TextInputType.number,
                          controller: controller.txtPrice,
                        ),
                        verticalSpace(10.h),
                        Container(
                          padding: EdgeInsets.only(left: 6.w, right: 7.w),
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColor.bodyColor.shade300,
                              )),
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Icon(
                                      Icons.event_seat_rounded,
                                      color: AppColor.greyColorLight,
                                      size: IconSizes.sm,
                                    ),
                                  ),
                                  horizontalSpace(10.w),
                                  Obx(
                                    () => SizedBox(
                                      width: Get.width * 0.60.w,
                                      height: Get.height * 0.05.h,
                                      child: DropdownButton(
                                        hint: const Text('Ketersediaan Tempat'),
                                        onChanged: (newValue) {
                                          controller.dropDownValue.value =
                                              newValue.toString();
                                          controller.update();
                                        },
                                        value: controller.dropDownValue.value,
                                        items: [
                                          for (var data
                                              in controller.dropDownList)
                                            DropdownMenuItem(
                                              child: Text(
                                                data,
                                                style: TextStyles.inter
                                                    .copyWith(
                                                        fontSize: FontSizes.s12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              value: data,
                                            ),
                                        ],
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'kursi',
                                    style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.greyColorLight),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                  ),
                  verticalSpace(Insets.med),
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
                      cornerRadius: 9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
