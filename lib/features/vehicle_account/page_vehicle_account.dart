import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intake_rider/features/vehicle_account/controller_vehicle_account.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_date.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageVehicleAccount extends GetView<ControllerVehicleAccount> {
  const PageVehicleAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Perbarui Profil Kendaraan',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: true,
      padding: EdgeInsets.zero,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
          // child: Obx(            () =>
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InputPrimary(
                  hintText: 'No SIM',
                  onTap: () {},
                  prefixIcon: const Icon(CupertinoIcons.creditcard),
                  boxWidth: Get.width * 0.88.w,
                ),
                InputDate(
                  controller: controller.txtDate,
                  selectedDate: (value) {},
                  isValid: (value) {},
                  boxWidth: Get.width * 0.88.w,
                  prefixIcon: const Icon(Icons.date_range),
                  hintText: 'Masa Berlaku SIM',
                ),
                GestureDetector(
                  onTap: () => controller.simSourceSelector(context),
                  child: (controller.sim.value != "")
                      ? Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(controller.sim.toString()),
                              width: Get.width * 0.88.w,
                              height: Get.height * 0.25.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 5.h),
                          height: Get.height * 0.25.h,
                          width: Get.width * 0.88.w,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppColor.whiteColor),
                          child: Center(
                            child: DottedBorder(
                              dashPattern: const [12, 4],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              color: AppColor.greyColorLight,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: SizedBox(
                                width: Get.width * 0.75.w,
                                height: Get.height * 0.20.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      CupertinoIcons.person_fill,
                                      size: 35,
                                      color: AppColor.greyColorLight,
                                    ),
                                    verticalSpace(5.h),
                                    Text(
                                      'Foto SIM',
                                      style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.greyColorLight),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                InputPrimary(
                  hintText: 'Nomor Plat Kendaraan',
                  onTap: () {},
                  prefixIcon: const Icon(CupertinoIcons.number_square),
                  boxWidth: Get.width * 0.88.w,
                  padding: EdgeInsets.only(top: 5.h),
                ),
                InputPrimary(
                  hintText: 'Merek Kendaraan',
                  onTap: () {},
                  prefixIcon: const Icon(CupertinoIcons.car),
                  boxWidth: Get.width * 0.88.w,
                  padding: EdgeInsets.only(top: 5.h),
                ),
                InputPrimary(
                  hintText: 'Warna Kendaraan',
                  onTap: () {},
                  prefixIcon: const Icon(CupertinoIcons.color_filter),
                  boxWidth: Get.width * 0.88.w,
                  padding: EdgeInsets.only(top: 5.h),
                ),
                GestureDetector(
                  onTap: () => controller.stnkSourceSelector(context),
                  child: (controller.stnk.value != "")
                      ? Container(
                          margin: EdgeInsets.only(top: 5.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(controller.stnk.toString()),
                              width: Get.width * 0.88.w,
                              height: Get.height * 0.25.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 5.h),
                          height: Get.height * 0.25.h,
                          width: Get.width * 0.88.w,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppColor.whiteColor),
                          child: Center(
                            child: DottedBorder(
                              dashPattern: const [12, 4],
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              color: AppColor.greyColorLight,
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              child: SizedBox(
                                width: Get.width * 0.75.w,
                                height: Get.height * 0.20.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      CupertinoIcons.person_fill,
                                      size: 35,
                                      color: AppColor.greyColorLight,
                                    ),
                                    verticalSpace(5.h),
                                    Text(
                                      'Foto STNK',
                                      style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.greyColorLight),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                verticalSpace(10.h),
                ButtonPrimary(
                  onPressed: () {},
                  label: 'Simpan',
                )
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
