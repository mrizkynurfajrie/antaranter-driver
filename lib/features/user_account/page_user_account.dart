import 'dart:io';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/user_account/controller_user_account.dart';
import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_email.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/constants/styles.dart';

class PageUserAccount extends GetView<ControllerUserAccount> {
  const PageUserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Perbarui Akun Pengguna',
      toolbarColor: AppColor.primaryColor,
      padding: EdgeInsets.zero,
      enableBack: true,
      backgroundColor: AppColor.bgPageColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Obx(
              () => CardRounded(
                color: AppColor.bgPageColor,
                shadow: Shadows.none,
                margin: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => controller.imgSourceSelector(context),
                          child: (controller.imgPreview != "")
                              ? DottedBorder(
                                  dashPattern: const [12, 4],
                                  strokeWidth: 1,
                                  strokeCap: StrokeCap.round,
                                  color: AppColor.greyColorLight,
                                  borderType: BorderType.Circle,
                                  radius: const Radius.circular(12),
                                  child: SizedBox(
                                    width: IconSizes.xxl,
                                    height: IconSizes.xxl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(controller.imgPreview.value),
                                        width: IconSizes.xxl,
                                        height: IconSizes.xxl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              : DottedBorder(
                                  dashPattern: const [12, 4],
                                  strokeWidth: 1,
                                  strokeCap: StrokeCap.round,
                                  color: AppColor.greyColorLight,
                                  borderType: BorderType.Circle,
                                  radius: const Radius.circular(12),
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: IconSizes.xxl,
                                    width: IconSizes.xxl,
                                    child: Container(
                                        padding: const EdgeInsets.all(2),
                                        child: (controller.controllerRiderInfo
                                                        .rider.value.image !=
                                                    '' &&
                                                controller.controllerRiderInfo
                                                        .rider.value.image !=
                                                    null)
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: SizedBox(
                                                  height: IconSizes.xxl,
                                                  width: IconSizes.xxl,
                                                  child: Image.network(
                                                    "${Api1().imgStorUrl}${controller.controllerRiderInfo.rider.value.image}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: IconSizes.med,
                                                    height: IconSizes.med,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: SvgPicture.asset(
                                                        'assets/images/avatar_dummy.svg',
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Tambah Foto',
                                                    style: TextStyles.inter
                                                        .copyWith(
                                                      fontSize: 8,
                                                      color: AppColor.greyColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              )),
                                  ),
                                ),
                        ),
                        horizontalSpace(10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.controllerRiderInfo.rider.value.name ??
                                  '-',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpace(2.h),
                            Row(
                              children: [
                                Text(
                                  "+62",
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  controller.controllerRiderInfo.rider.value
                                          .phone ??
                                      '-',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpace(2.h),
                            Text(
                              controller
                                      .controllerRiderInfo.rider.value.email ??
                                  '-',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.neutral,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InputPrimary(
                            hintText: 'Nama',
                            onTap: () {},
                            prefixIcon: const Icon(Icons.person),
                            maxLines: 1,
                            padding: EdgeInsets.only(bottom: 3.h, top: 2.h),
                            controller: controller.txtName,
                            label: 'Nama',
                          ),
                        ),
                        horizontalSpace(4.w),
                        InputDate(
                          controller: controller.txtDate,
                          selectedDate: (value) {},
                          isValid: (value) {},
                          boxWidth: Get.width * 0.30.w,
                          prefixIcon: const Icon(Icons.date_range),
                          hintText: 'Tanggal Lahir',
                          padding: EdgeInsets.only(top: 1.h, bottom: 4.h),
                          label: 'Tanggal Lahir',
                        ),
                      ],
                    ),
                    Obx(
                      () => SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis Kelamin',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.neutral,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.buildGender();
                              },
                              child: CardRounded(
                                width: Get.width,
                                margin: EdgeInsets.only(
                                    top: 2.h,
                                    bottom: 4.h,
                                    left: 2.w,
                                    right: 2.w),
                                borderRadius: 6,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (controller.gender.value == '')
                                          ? (controller.selectedGender.value ==
                                                  'male')
                                              ? "Laki-Laki"
                                              : (controller.selectedGender
                                                          .value ==
                                                      'female')
                                                  ? "Perempuan"
                                                  : "Pilih Jenis Kelamin"
                                          // : (controller.gender.value == 'male')
                                          //     ? "Laki-Laki"
                                          //     : "Perempuan",
                                          : controller.gender.value,
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: IconSizes.sm,
                                      color: AppColor.bodyColor.shade600,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InputEmail(
                      controller: controller.txtEmail,
                      isValid: (value) {},
                      email: (value) {},
                      hintText: 'E-mail',
                      prefixIcon: const Icon(Icons.mail),
                      boxWidth: Get.width,
                      label: 'E-mail',
                    ),
                    InputPrimary(
                      hintText: 'NIK',
                      onTap: () {},
                      prefixIcon: const Icon(CupertinoIcons.number),
                      maxLines: 1,
                      boxWidth: Get.width,
                      padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                      controller: controller.txtNik,
                      label: 'NIK',
                      inputFormatters: [LengthLimitingTextInputFormatter(16)],
                      validate: (value) {
                        if (!isValidIdNumber(idNumber: value.toString())) {
                          return '- Tolong isi NIK dengan baik dan benar (16 Digit)';
                        }
                        return null;
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Unggah Foto KTP',
                          style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s12,
                              color: AppColor.neutral,
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () => controller.ktpSourceSelector(context),
                          child: (controller.ktpPreview.value != "")
                              ? Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(controller.ktpPreview.value),
                                      width: Get.width,
                                      height: Get.height * 0.25.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(top: 5.h),
                                  height: Get.height * 0.25.h,
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: AppColor.whiteColor),
                                  child: (controller.controllerRiderInfo.rider
                                                  .value.ktpPict !=
                                              '' &&
                                          controller.controllerRiderInfo.rider
                                                  .value.ktpPict !=
                                              null)
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: SizedBox(
                                            width: Get.width.w,
                                            height: Get.height.h,
                                            child: Image.network(
                                              "${Api1().imgStorUrl}${controller.controllerRiderInfo.rider.value.ktpPict}",
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
                                                    'Foto KTP',
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
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Provinsi & Kota',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s12,
                              color: AppColor.neutral,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InputSelection(
                            valueText: controller.itemProvince.value,
                            hintText: 'select_province'.tr,
                            onTap: () {
                              controller.buildProvince(context);
                              controller.cities.clear();
                            },
                            padding: EdgeInsets.all(Insets.sm),
                            width: Get.width,
                            margin: EdgeInsets.only(
                              bottom: 5.h,
                            ),
                            isRequired: false,
                          ),
                          Text(
                              "Sebelum memilih kota, silakan pilih provinsi terlebih dahulu",
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s11,
                                color: AppColor.greyColor,
                                fontWeight: FontWeight.w300,
                              )),
                          InputSelection(
                            valueText: controller.itemCities.value == null
                                ? 'Kota'
                                : controller.itemCities.value,
                            hintText: 'select_cities'.tr,
                            onTap: () {
                              controller.buildCities(context);
                            },
                            padding: EdgeInsets.all(Insets.sm),
                            margin: EdgeInsets.only(bottom: 5.h),
                            width: Get.width,
                            isRequired: false,
                          ),
                        ],
                      ),
                    ),
                    InputPrimary(
                      controller: controller.txtAddress,
                      onTap: () {},
                      hintText: 'Alamat',
                      maxLenght: 150,
                      maxLines: 3,
                      boxWidth: Get.width,
                      padding: EdgeInsets.only(
                          top: 2.h, bottom: 3.h),
                      label: 'Alamat',
                    ),
                    verticalSpace(5.h),
                    controller.loadingForm.isFalse
                        ? ButtonPrimary(
                            onPressed: () async {
                              if (controller
                                      .controllerRiderInfo.rider.value.status ==
                                  0) {
                                await controller.updateUserAccount();
                                showPopUp(
                                  title: 'Berhasil',
                                  description:
                                      'Anda berhasil mengubah profil pengguna',
                                  imageUri: PopUpIcons.success,
                                  dismissible: false,
                                );
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                controller.dialogProfilKendaraan();
                              } else {
                                await controller.dialogUbahProfil();
                              }
                            },
                            label: 'Simpan',
                            // size: 320.w,
                            cornerRadius: 9,
                          )
                        : loadingIndicator(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
