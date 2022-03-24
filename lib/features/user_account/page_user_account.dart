import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/user_account/controller_user_account.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_date.dart';
import 'package:intake_rider/shared/widgets/inputs/input_email.dart';
import 'package:intake_rider/shared/widgets/inputs/input_phone.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          height: IconSizes.xxxl,
                          width: IconSizes.xxxl,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: 'https://via.placeholder.com/150',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Shimmer(
                              gradient: AppColor.shimmerGradient,
                              child: Container(
                                color: AppColor.whiteColor,
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/avatar_dummy.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'mrizkynurfajrie',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpace(2.h),
                          Text(
                            '0852xxxxxx',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              color: AppColor.neutral,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          verticalSpace(2.h),
                          Text(
                            'driver@mail.com',
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
                    boxWidth: 345.w,
                  ),
                  InputPrimary(
                    hintText: 'Nama',
                    onTap: () {},
                    prefixIcon: const Icon(Icons.person),
                    maxLines: 1,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 5.h),
                  ),
                  InputPhone(
                    controller: controller.txtPhone,
                    phoneNumber: (value) {},
                    label: '',
                  ),
                  InputPrimary(
                    hintText: 'NIK',
                    onTap: () {},
                    prefixIcon: const Icon(CupertinoIcons.number),
                    maxLines: 1,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 5.h),
                  ),
                  GestureDetector(
                    onTap: () => controller.ktpSourceSelector(context),
                    child: (controller.ktp.value != "")
                        ? Container(
                            margin: EdgeInsets.only(top: 5.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(controller.ktp.toString()),
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
                  InputDate(
                    controller: controller.txtDate,
                    selectedDate: (value) {},
                    isValid: (value) {},
                    boxWidth: Get.width * 0.88.w,
                    prefixIcon: const Icon(Icons.date_range),
                    hintText: 'Tanggal Lahir',
                  ),
                  InputPrimary(
                    hintText: 'Kota',
                    onTap: () {},
                    prefixIcon: const Icon(
                      Icons.place,
                    ),
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 5.h),
                  ),
                  InputPrimary(
                    controller: controller.txtAddress,
                    onTap: () {},
                    hintText: 'Alamat',
                    prefixIcon: const Icon(CupertinoIcons.map),
                    maxLenght: 150,
                    maxLines: 3,
                    boxWidth: Get.width * 0.88.w,
                    padding: EdgeInsets.only(top: 5.h),
                  ),
                  verticalSpace(5.h),
                  ButtonPrimary(
                    onPressed: () {},
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
