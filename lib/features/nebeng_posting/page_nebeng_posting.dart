import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/inputs/input_date.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_selection.dart';
import 'package:intake_rider/shared/widgets/inputs/input_time.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'controller_nebeng_posting.dart';

class PageNebengPosting extends GetView<ControllerNebengPosting> {
  const PageNebengPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      toolbarColor: AppColor.primaryColor,
      backgroundColor: AppColor.bgPageColor,
      enableBack: true,
      toolbarTitleColor: AppColor.bgPageColor,
      center: Align(
        child: Text(
          "AntarAnter",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: FontSizes.s16,
            fontWeight: FontWeight.w500,
            color: AppColor.whiteColor,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Icon(
                                Icons.perm_identity,
                                color: AppColor.primaryColor,
                                size: IconSizes.sm,
                              ),
                            ),
                            horizontalSpace(10.w),
                            Obx(
                              () => SizedBox(
                                width: Get.width * 0.15.w,
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
                                    for (var data in controller.dropDownList)
                                      DropdownMenuItem(
                                        child: Text(
                                          data,
                                          style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        value: data,
                                      ),
                                  ],
                                  isExpanded: true,
                                ),
                              ),
                            ),
                            Text(
                              'orang',
                              style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColorLight),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InputSelection(
                              valueText: controller.itemProvinceDept.value,
                              hintText: 'select_province'.tr,
                              onTap: () {
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
                              onTap: () {
                                controller.buildCities(context);
                              },
                              padding: EdgeInsets.all(Insets.sm),
                              margin: EdgeInsets.only(bottom: 5.h),
                              width: Get.width * 0.65.w,
                            ),
                            InputDate(
                              hintText: 'Pilih Tanggal Berangkat',
                              controller: controller.txtDateDept,
                              selectedDate: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.date_range,
                                color: AppColor.greyColor,
                                size: 20,
                              ),
                              boxWidth: Get.width * 0.65.w,
                            ),
                            verticalSpace(5.h),
                            InputTime(
                              hintText: 'Pilih Waktu Berangkat',
                              controller: controller.txtTimeDept,
                              selectedTime: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.watch,
                                size: 20,
                                color: AppColor.greyColor,
                              ),
                              boxWidth: Get.width * 0.65.w,
                            ),
                          ],
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
                              valueText: controller.itemProvinceArrv.value,
                              hintText: 'select_province'.tr,
                              onTap: () {
                                controller.buildProvinceArrv(context);
                                controller.cities.clear();
                              },
                              padding: EdgeInsets.all(Insets.sm),
                              width: Get.width * 0.65.w,
                              margin: EdgeInsets.only(bottom: 5.h),
                            ),
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
                              selectedDate: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.date_range,
                                color: AppColor.primaryColor,
                                size: 20,
                              ),
                              boxWidth: Get.width * 0.65.w,
                            ),
                            verticalSpace(5.h),
                            InputTime(
                              hintText: 'Pilih Waktu Tiba',
                              controller: controller.txtTimeArrv,
                              selectedTime: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.watch,
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
                  child: InputPrimary(
                    hintText: 'Harga Perjalanan',
                    onTap: () {},
                    prefixIcon: const Icon(Icons.confirmation_number),
                    inputFormatters: [
                      controller.maskFormatter,
                      LengthLimitingTextInputFormatter(7)
                    ],
                    keyboardType: TextInputType.number,
                    controller: controller.txtPrice,
                  ),
                ),
                verticalSpace(Insets.med),
                ButtonPrimary(
                  enable: controller.isValidForm.value,
                  onPressed: () {
                    controller.validateForm();
                    if (controller.isValidForm.value) {
                      controller.createNebengPosting();
                    }
                  },
                  label: 'Bagikan',
                  color: AppColor.primaryColor,
                  size: 340.w,
                  cornerRadius: 9,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
