import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/user_account/controller_user_account.dart';
import 'package:intake_rider/framework/api1.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_date.dart';
import 'package:intake_rider/shared/widgets/inputs/input_email.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Obx(
              () => Column(
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
                                              '')
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              child: SizedBox(
                                                height: IconSizes.xxl,
                                                width: IconSizes.xxl,
                                                child: Image.network(
                                                  "${Api1().baseUrl}images/${controller.controllerRiderInfo.rider.value.image}",
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
                                                    child: Image.asset(
                                                      'assets/images/avatar_dummy.png',
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Tambah Foto',
                                                  style:
                                                      TextStyles.inter.copyWith(
                                                    fontSize: 8,
                                                    color: AppColor.greyColor,
                                                    fontWeight: FontWeight.w500,
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
                          Text(
                            controller.controllerRiderInfo.rider.value.phone ??
                                '-',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              color: AppColor.neutral,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          verticalSpace(2.h),
                          Text(
                            controller.controllerRiderInfo.rider.value.email ??
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
                  InputEmail(
                    controller: controller.txtEmail,
                    isValid: (value) {},
                    email: (value) {},
                    hintText: 'E-mail',
                    prefixIcon: const Icon(Icons.mail),
                    boxWidth: Get.width * 0.88.w,
                    label: 'E-mail',
                  ),
                  InputPrimary(
                    hintText: 'Nama',
                    onTap: () {},
                    prefixIcon: const Icon(Icons.person),
                    maxLines: 1,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(bottom: 3.h, top: 2.h),
                    controller: controller.txtName,
                    label: 'Nama',
                  ),
                  InputPrimary(
                    hintText: 'NIK',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.number),
                    maxLines: 1,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    controller: controller.txtNik,
                    label: 'NIK',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Icon(
                                            CupertinoIcons.person_fill,
                                            size: 35,
                                            color: AppColor.greyColorLight,
                                          ),
                                          verticalSpace(5.h),
                                          Text(
                                            'Foto KTP',
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
                      verticalSpace(5.h)
                    ],
                  ),
                  InputDate(
                    controller: controller.txtDate,
                    selectedDate: (value) {},
                    isValid: (value) {},
                    boxWidth: Get.width * 0.88.w,
                    prefixIcon: const Icon(Icons.date_range),
                    hintText: 'Tanggal Lahir',
                    padding: EdgeInsets.only(top: 1.h, bottom: 3.h),
                    label: 'Tanggal Lahir',
                  ),
                  InputPrimary(
                    hintText: 'Kota',
                    onTap: () {},
                    prefixIcon: const Icon(
                      Icons.place,
                    ),
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    label: 'Kota',
                    controller: controller.txtCity,
                  ),
                  InputPrimary(
                    controller: controller.txtAddress,
                    onTap: () {},
                    hintText: 'Alamat',
                    prefixIcon: const Icon(CupertinoIcons.map),
                    maxLenght: 150,
                    maxLines: 3,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                    label: 'Alamat',
                  ),
                  verticalSpace(5.h),
                  ButtonPrimary(
                    onPressed: () async {
                      await controller.uploadImgRider();
                      await controller.uploadKtpRider();
                      controller.updateUserAccount();
                    },
                    label: 'Simpan',
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
