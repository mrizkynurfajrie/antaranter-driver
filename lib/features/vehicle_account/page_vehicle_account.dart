import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:antaranter_driverapp/features/vehicle_account/controller_vehicle_account.dart';
import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

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
          child: Obx(
            () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InputPrimary(
                    hintText: 'No SIM',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.creditcard),
                    boxWidth: Get.width * 0.88.w,
                    controller: controller.txtSimNum,
                    inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    label: 'No. SIM',
                    padding: EdgeInsets.only(bottom: 3.h),
                  ),
                  InputDate(
                    controller: controller.txtSimExp,
                    selectedDate: (value) {},
                    isValid: (value) {},
                    boxWidth: Get.width * 0.88.w,
                    prefixIcon: const Icon(Icons.date_range),
                    hintText: 'Masa Berlaku SIM',
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    label: 'Masa Berlaku SIM',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unggah Foto SIM',
                        style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            color: AppColor.neutral,
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () => controller.simSourceSelector(context),
                        child: (controller.simPreview.value != "")
                            ? Container(
                                margin: EdgeInsets.only(top: 5.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(controller.simPreview.toString()),
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
                                child: (controller.controllerVehicleInfo.vehicle
                                                .value.simPict !=
                                            '' &&
                                        controller.controllerVehicleInfo.vehicle
                                                .value.simPict !=
                                            null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          width: Get.width.w,
                                          height: Get.height.h,
                                          child: Image.network(
                                            "${Api1().imgStorUrl}${controller.controllerVehicleInfo.vehicle.value.simPict}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Center(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Icon(
                                                  CupertinoIcons.person_fill,
                                                  size: 35,
                                                  color:
                                                      AppColor.greyColorLight,
                                                ),
                                                verticalSpace(5.h),
                                                Text(
                                                  'Foto SIM',
                                                  style: TextStyles.inter
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor
                                                              .greyColorLight),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                      ),
                      verticalSpace(5.h)
                    ],
                  ),
                  InputPrimary(
                    hintText: 'Nomor Plat Kendaraan',
                    label: 'Nomor Plat Kendaraan',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.number_square),
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    controller: controller.txtPlatNum,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      // controller.maskFormatter,
                    ],
                    textCapitalization: TextCapitalization.characters,
                  ),
                  InputPrimary(
                    hintText: 'Merek Kendaraan',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.car),
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    controller: controller.txtVehicleVar,
                    label: 'Merek Kendaraan',
                    textCapitalization: TextCapitalization.characters,
                  ),
                  InputPrimary(
                    hintText: 'Warna Kendaraan',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.color_filter),
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    controller: controller.txtVehicleCol,
                    label: 'Warna Kendaraan',
                    textCapitalization: TextCapitalization.characters,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unggah Foto STNK',
                        style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            color: AppColor.neutral,
                            fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        onTap: () => controller.stnkSourceSelector(context),
                        child: (controller.stnkPreview.value != "")
                            ? Container(
                                margin: EdgeInsets.only(top: 5.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(controller.stnkPreview.toString()),
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
                                child: (controller.controllerVehicleInfo.vehicle
                                                .value.stnkPict !=
                                            '' &&
                                        controller.controllerVehicleInfo.vehicle
                                                .value.stnkPict !=
                                            null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: SizedBox(
                                          width: Get.width.w,
                                          height: Get.height.h,
                                          child: Image.network(
                                            "${Api1().imgStorUrl}${controller.controllerVehicleInfo.vehicle.value.stnkPict}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Center(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                const Icon(
                                                  CupertinoIcons.person_fill,
                                                  size: 35,
                                                  color:
                                                      AppColor.greyColorLight,
                                                ),
                                                verticalSpace(5.h),
                                                Text(
                                                  'Foto STNK',
                                                  style: TextStyles.inter
                                                      .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor
                                                              .greyColorLight),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  controller.loading.isFalse?
                  ButtonPrimary(
                    size: 320.w,
                    cornerRadius: 9,
                    onPressed: () async {
                      await controller.updateVehicleAccount();
                    },
                    label: 'Simpan',
                  ):loadingIndicator(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }