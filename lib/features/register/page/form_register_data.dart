import 'dart:io';
import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_email.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_selection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormRegisterData extends GetView<ControllerRegister> {
  const FormRegisterData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            AppIcons.circlebg,
            width: Get.width,
            color: AppColor.primaryColor,
            fit: BoxFit.fitWidth,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
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
                                    width: IconSizes.profPictSet,
                                    height: IconSizes.profPictSet,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(controller.imgPreview.value),
                                        width: IconSizes.profPictSet,
                                        height: IconSizes.profPictSet,
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
                                    height: IconSizes.profPictSet,
                                    width: IconSizes.profPictSet,
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
                                                  height: IconSizes.profPictSet,
                                                  width: IconSizes.profPictSet,
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
                                                        AppIcons.dummyAvatar,
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
                        verticalSpace(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.controllerRiderInfo.rider.value
                                          .phone !=
                                      null
                                  ? '+62${controller.controllerRiderInfo.rider.value.phone}'
                                  : '+62${controller.cPhoneNumber.text}',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.neutral.shade500,
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
                            onChange: (value) {},
                            enable: false,
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
                                controller.genderActive.value = true;
                              },
                              child: CardRoundedBorder(
                                width: Get.width,
                                shadow: Shadows.none,
                                borderColor:
                                    controller.genderActive.value == true
                                        ? AppColor.primaryColor
                                        : AppColor.bodyColor.shade300,
                                borderWidth: 1,
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
                                      style: TextStyles.body3,
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
                      onChange: (value) {},
                      controller: controller.txtEmail,
                      isValid: (value) {},
                      email: (value) {},
                      hintText: 'E-mail',
                      prefixIcon: const Icon(Icons.mail),
                      boxWidth: Get.width,
                      label: 'E-mail',
                    ),
                    InputPrimary(
                      onChange: (value) {},
                      hintText: 'NIK',
                      onTap: () {},
                      prefixIcon: const Icon(CupertinoIcons.number),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
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
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(controller.ktpPreview.value),
                                      width: Get.width,
                                      height: 170.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(top: 5.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  height: 170.h,
                                  width: Get.width,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: AppColor.whiteColor),
                                  child: (controller.controllerRiderInfo.rider
                                                  .value.ktpPict !=
                                              '' &&
                                          controller.controllerRiderInfo.rider
                                                  .value.ktpPict !=
                                              null)
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: SizedBox(
                                            width: Get.width,
                                            height: 170.h,
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
                                            radius: const Radius.circular(8),
                                            child: SizedBox(
                                              width: 345.w,
                                              height: 170.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  AppIcons.iconApp(
                                                    AppIcons.addPhoto,
                                                    height: 56.h,
                                                    color: AppColor
                                                        .neutral.shade500,
                                                  ),
                                                  verticalSpace(5.h),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Unggah Gambar KTP',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor
                                                              .neutral.shade500,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Format : JPG atau PNG',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColor
                                                              .neutral.shade500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                      onChange: (value) {},
                      controller: controller.txtAddress,
                      onTap: () {},
                      hintText: 'Alamat',
                      maxLenght: 150,
                      maxLines: 3,
                      boxWidth: Get.width,
                      padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                      label: 'Alamat',
                    ),
                    // controller.loading.isFalse
                    //     ? ButtonPrimary(
                    //         onPressed: () async {
                    //           if (controller
                    //                   .controllerRiderInfo.rider.value.status ==
                    //               0) {
                    //             controller.validateForm();
                    //             if (controller.isValidForm.value == true) {
                    //               // await controller.updateUserAccount();
                    //               showPopUp(
                    //                 title: 'Berhasil',
                    //                 description:
                    //                     'Anda berhasil mengubah profil pengguna',
                    //                 imageUri: PopUpIcons.success,
                    //                 dismissible: false,
                    //               );
                    //               await Future.delayed(
                    //                   const Duration(seconds: 2));
                    //               // controller.dialogProfilKendaraan();
                    //             } else {
                    //               showPopUp(
                    //                 title: 'Gagal',
                    //                 description:
                    //                     'Mohon isi data pengguna dengan lengkap dan benar',
                    //                 imageUri: PopUpIcons.error,
                    //                 imageSize: IconSizes.xxl,
                    //                 dismissible: false,
                    //               );
                    //               await Future.delayed(
                    //                   const Duration(seconds: 3));
                    //               Get.back();
                    //             }
                    //           } else {
                    //             controller.validateForm();
                    //             if (controller.isValidForm.value == true) {
                    //               // controller.dialogUbahProfil();
                    //             } else {
                    //               showPopUp(
                    //                 title: 'Gagal',
                    //                 description:
                    //                     'Mohon isi data pengguna dengan lengkap dan benar',
                    //                 imageUri: PopUpIcons.error,
                    //                 imageSize: IconSizes.xxl,
                    //                 dismissible: false,
                    //               );
                    //               await Future.delayed(
                    //                   const Duration(seconds: 3));
                    //               Get.back();
                    //             }
                    //           }
                    //         },
                    //         label: 'Simpan',
                    //         size: 345.w,
                    //         height: 45.h,
                    //         cornerRadius: 8,
                    //       )
                    //     : loadingIndicator(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
