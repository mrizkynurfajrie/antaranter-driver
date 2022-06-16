import 'dart:developer';

import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/controller_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/response/nebeng_order.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/currency_formatter.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class PageNebengPostingDetail extends GetView<ControllerNebengPostingDetail> {
  const PageNebengPostingDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: Align(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
        alignment: Alignment.center,
      ),
      child: Obx(
        () => controller.loading.isFalse
            ? RefreshIndicator(
                onRefresh: () async {
                  controller.onRefresh();
                },
                child: SizedBox(
                  child: controller.controllerRiderInfo.hasActivePost.value ==
                          true
                      ? CustomScrollView(
                          slivers: [
                            SliverFillRemaining(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //card info//
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.h, bottom: 5.h),
                                    child: Container(
                                      // borderColor: AppColor.greyColorLight,
                                      // borderRadius: 9,
                                      // borderWidth: 2,
                                      color: AppColor.whiteColor,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 5.w),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: Get.width * 0.32.w,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.car_rental,
                                                            size: IconSizes.med,
                                                            color: AppColor
                                                                .primaryColor,
                                                          ),
                                                          horizontalSpace(5.w),
                                                          Text(
                                                            controller
                                                                    .controllerPostingan
                                                                    .postingan
                                                                    .value
                                                                    .nebengRider
                                                                    ?.vehicleVariant ??
                                                                '',
                                                            style: TextStyles
                                                                .inter
                                                                .copyWith(
                                                              fontSize:
                                                                  FontSizes.s14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .greyColorLight,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.perm_identity,
                                                          size: IconSizes.med,
                                                          color: AppColor
                                                              .primaryColor,
                                                        ),
                                                        horizontalSpace(5.w),
                                                        // Text(
                                                        //   controller
                                                        //           .controllerPostingan
                                                        //           .postingan
                                                        //           .value
                                                        //           .nebengPosting
                                                        //           ?.seatAvail
                                                        //           .toString() ??
                                                        //       '',
                                                        //   style: TextStyles
                                                        //       .inter
                                                        //       .copyWith(
                                                        //     fontSize:
                                                        //         FontSizes.s14,
                                                        //     fontWeight:
                                                        //         FontWeight.w500,
                                                        //     color: AppColor
                                                        //         .greyColorLight,
                                                        //   ),
                                                        // )
                                                        RichText(
                                                          text: TextSpan(
                                                            text: "${controller.controllerPostingan.postingan.value.nebengOrder!.length}"
                                                                    .isEmpty
                                                                ? "0"
                                                                : "${controller.controllerPostingan.postingan.value.nebengOrder!.length}",
                                                            style: TextStyles
                                                                .inter
                                                                .copyWith(
                                                              fontSize:
                                                                  FontSizes.s14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .greyColorLight,
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "/${controller.controllerPostingan.postingan.value.nebengPosting!.seatAvail}",
                                                                style: TextStyles
                                                                    .inter
                                                                    .copyWith(
                                                                  fontSize:
                                                                      FontSizes
                                                                          .s14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: AppColor
                                                                      .greyColor,
                                                                ),
                                                              ),
                                                              controller
                                                                          .controllerPostingan
                                                                          .postingan
                                                                          .value
                                                                          .nebengPosting!
                                                                          .seatAvail ==
                                                                      controller
                                                                          .controllerPostingan
                                                                          .postingan
                                                                          .value
                                                                          .nebengPosting!
                                                                          .count
                                                                  ? TextSpan(
                                                                      text:
                                                                          " (penuh)",
                                                                      style: TextStyles.inter.copyWith(
                                                                          fontSize: FontSizes
                                                                              .s14,
                                                                          color:
                                                                              AppColor.errorColor))
                                                                  : const TextSpan()
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  CurrencyFormat.convertToIdr(
                                                      controller
                                                              .controllerPostingan
                                                              .postingan
                                                              .value
                                                              .nebengPosting
                                                              ?.price ??
                                                          0,
                                                      0),
                                                  style:
                                                      TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColor.greyColorLight,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            verticalSpace(9.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.30.w,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(
                                                        CupertinoIcons.number,
                                                        size: IconSizes.med,
                                                        color: AppColor
                                                            .primaryColor,
                                                      ),
                                                      horizontalSpace(5.w),
                                                      Text(
                                                        controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengRider
                                                                ?.platNumber
                                                                .toString() ??
                                                            '',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColor
                                                              .greyColorLight,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                horizontalSpace(9.w),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      CupertinoIcons
                                                          .color_filter,
                                                      size: IconSizes.med,
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    horizontalSpace(5.w),
                                                    Text(
                                                      controller
                                                              .controllerPostingan
                                                              .postingan
                                                              .value
                                                              .nebengRider
                                                              ?.vehicleColor
                                                              .toString() ??
                                                          '',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColor
                                                            .greyColorLight,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            verticalSpace(25.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.my_location,
                                                      size: IconSizes.med,
                                                      color: AppColor.greyColor,
                                                    ),
                                                    horizontalSpace(5.w),
                                                    SizedBox(
                                                      width: Get.width * 0.32.w,
                                                      child: Text(
                                                        controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting
                                                                ?.cityOrigin ??
                                                            '',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          color: AppColor
                                                              .greyColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.20.w,
                                                  child: Text(
                                                    FormatDateTime.formatDateWithoutHour(
                                                            value: controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting!
                                                                .dateDep!)
                                                        .toString(),
                                                    style: TextStyles.inter
                                                        .copyWith(
                                                      fontSize: FontSizes.s14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor.greyColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.16.w,
                                                  child: Obx(
                                                    () => Text(
                                                      controller
                                                          .controllerPostingan
                                                          .postingan
                                                          .value
                                                          .nebengPosting!
                                                          .timeDep!
                                                          .toString(),
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColor.greyColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            verticalSpace(10.h),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.my_location,
                                                      size: IconSizes.med,
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    horizontalSpace(5.w),
                                                    SizedBox(
                                                      width:
                                                          Get.width * 0.323.w,
                                                      child: Text(
                                                        controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting
                                                                ?.cityDestination
                                                                .toString() ??
                                                            '',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          color: AppColor
                                                              .greyColor,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.20.w,
                                                  child: Text(
                                                    FormatDateTime.formatDateWithoutHour(
                                                            value: controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting!
                                                                .dateArr!)
                                                        .toString(),
                                                    style: TextStyles.inter
                                                        .copyWith(
                                                      fontSize: FontSizes.s14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColor.greyColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.16.w,
                                                  child: Obx(
                                                    () => Text(
                                                      controller
                                                          .controllerPostingan
                                                          .postingan
                                                          .value
                                                          .nebengPosting!
                                                          .timeArr!
                                                          .toString(),
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            AppColor.greyColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ),
                                  //list user//
                                  Container(
                                    height: Get.height * 0.310.h,
                                    width: Get.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: Insets.sm),
                                    child: controller.obx(
                                      (state) => ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            UserNebeng(
                                                nebengOrder: controller
                                                    .listUserNebeng[index]),
                                        itemCount:
                                            controller.listUserNebeng.length,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  //tombol//
                                  // verticalSpace(10.h),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    height: Get.height * 0.13.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: ButtonPrimary(
                                            onPressed: () {
                                              controller.dialogUbah();
                                            },
                                            label: 'Ubah Waktu Perjalanan',
                                            // enable: controller.checkAvailableButton(),
                                            enable: (controller
                                                        .statusNebeng.value ==
                                                    1)
                                                ? true
                                                : false,
                                            color: AppColor.whiteColor,
                                            labelStyle:
                                                TextStyles.inter.copyWith(
                                              color: (controller
                                                          .statusNebeng.value ==
                                                      1)
                                                  ? AppColor.primaryColor
                                                  : AppColor.whiteColor,
                                              fontSize: FontSizes.s14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            height: Get.height * 0.08,
                                            cornerRadius: 4,
                                            borderColor: AppColor.primaryColor,
                                          ),
                                        ),
                                        verticalSpace(10.h),
                                        Expanded(
                                          child: ButtonPrimary(
                                            onPressed: () {
                                              controller.dialogBatal();
                                            },
                                            enable: (controller
                                                        .statusNebeng.value ==
                                                    1)
                                                ? true
                                                : false,
                                            label: 'Batalkan Perjalanan',
                                            color: AppColor.whiteColor,
                                            labelStyle:
                                                TextStyles.inter.copyWith(
                                              color: AppColor.errorColor,
                                              fontSize: FontSizes.s14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            height: Get.height * 0.08,
                                            cornerRadius: 4,
                                            borderColor: AppColor.errorColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  verticalSpace(10.h),
                                  //tombolbawah//
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: DottedBorder(
                                            dashPattern: const [12, 4],
                                            strokeWidth: 1,
                                            strokeCap: StrokeCap.round,
                                            color: AppColor.greyColorLight,
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(4),
                                            child: ButtonPrimary(
                                              onPressed: () {
                                                showPopUpChoice(
                                                    imageUri:
                                                        PopUpIcons.success,
                                                    title:
                                                        'Menyelesaikan Perjalanan',
                                                    description:
                                                        'Apakah anda telah sampai ke tujuan anda?',
                                                    onConfirm: () async {
                                                      await controller
                                                          .ubahStatus(3);
                                                      Get.back();
                                                    },
                                                    onCancel: () {
                                                      Get.back();
                                                    });
                                              },
                                              label: 'Perjalanan Selesai',
                                              color: AppColor.primaryColor,
                                              enable: (controller
                                                          .statusNebeng.value ==
                                                      2)
                                                  ? true
                                                  : false,
                                              labelStyle:
                                                  TextStyles.inter.copyWith(
                                                color: AppColor.whiteColor,
                                                fontSize: FontSizes.s14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              // height: Get.height * 0.09.h,
                                              cornerRadius: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: DottedBorder(
                                            dashPattern: const [12, 4],
                                            strokeWidth: 1,
                                            strokeCap: StrokeCap.round,
                                            color: AppColor.greyColorLight,
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(4),
                                            child: ButtonPrimary(
                                              onPressed: controller
                                                      .listUserNebeng.isNotEmpty
                                                  ? () {
                                                      controller.ubahStatus(2);
                                                    }
                                                  : () {
                                                      showPopUpError(
                                                          errorTitle:
                                                              'Perjalanan',
                                                          errorMessage:
                                                              'Anda belum bisa memulai perjalanan, karena tidak ada pelanggan yang nebeng dengan anda');
                                                    },
                                              // enable: (controller.statusNebeng
                                              //             .value ==
                                              //         1)
                                              //     ? true
                                              //     : false,
                                              enable: controller.buttonStart
                                                              .value ==
                                                          true &&
                                                      controller.statusNebeng
                                                              .value ==
                                                          1
                                                  ? true
                                                  : false,

                                              label: 'Mulai Perjalanan',
                                              color: AppColor.successColor,
                                              labelStyle:
                                                  TextStyles.inter.copyWith(
                                                color: AppColor.whiteColor,
                                                fontSize: FontSizes.s14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              // height: Get.height * 0.08.h,
                                              cornerRadius: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(5.h),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: Get.width.w,
                          height: Get.height.h,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  AppLotties.empty,
                                  width: Get.width * 0.4.w,
                                ),
                                verticalSpace(10.h),
                                Text(
                                  "Anda belum membagikan perjalanan anda",
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.neutral,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              )
            : loadingIndicator(context),
      ),
    );
  }
}

class UserNebeng extends GetView<ControllerNebengPostingDetail> {
  const UserNebeng({Key? key, required this.nebengOrder})
      : super(
          key: key,
        );

  final NebengOrder nebengOrder;

  @override
  Widget build(BuildContext context) {
    return CardRounded(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  log("gambar image : " + nebengOrder.users!.image.toString());
                  if (nebengOrder.users!.image != null) {
                    showPopUpImage(
                      imageUri: imageUrlPath(
                        '${nebengOrder.users?.image}',
                      ),
                    );
                  } else {
                    showPopUpImage(
                        imageUri:
                            'https://antaranter.sgp1.digitaloceanspaces.com/PROD/avatar_dummy.png');
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: SizedBox(
                    height: IconSizes.xxl,
                    width: IconSizes.xxl,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageUrlPath(
                        '${nebengOrder.users?.image}',
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Shimmer(
                        child: Container(color: AppColor.whiteColor),
                        gradient: AppColor.shimmerGradient,
                      ),
                      errorWidget: (context, url, error) => DottedBorder(
                        dashPattern: const [12, 4],
                        strokeWidth: 1,
                        strokeCap: StrokeCap.round,
                        color: AppColor.greyColorLight,
                        borderType: BorderType.Circle,
                        radius: const Radius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            AppIcons.dummyAvatar,
                            color: '${nebengOrder.users?.gender}' == 'male'
                                ? AppColor.genderMale
                                : AppColor.genderFemale,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(5.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(2),
                  Row(
                    children: [
                      CardRounded(
                          shadow: Shadows.none,
                          padding: EdgeInsets.zero,
                          child: '${nebengOrder.users?.gender}' == 'male'
                              ? Icon(
                                  Icons.male,
                                  size: IconSizes.sm,
                                  color: AppColor.genderMale,
                                )
                              : Icon(
                                  Icons.female,
                                  size: IconSizes.sm,
                                  color: AppColor.genderFemale,
                                )),
                      CardRounded(
                        shadow: Shadows.none,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '${nebengOrder.users?.username}',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(2),
                  CardRounded(
                    shadow: Shadows.none,
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          "+62",
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyColorLight,
                          ),
                        ),
                        Text(
                          '${nebengOrder.users?.phone}',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyColorLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(2),
                  CardRounded(
                    shadow: Shadows.none,
                    padding: EdgeInsets.zero,
                    child: Text(
                      nebengOrder.status == 1
                          ? 'Menunggu Waktu Perjalanan'
                          : nebengOrder.status == 2
                              ? 'Sedang Dalam Perjalanan'
                              : nebengOrder.status == 3
                                  ? 'Perjalanan Selesai'
                                  : 'Menunggu Persetujuan Pelanggan',
                      style: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s12,
                          fontWeight: FontWeight.w400,
                          color: nebengOrder.status == 1
                              ? AppColor.orangeColor
                              : nebengOrder.status == 2
                                  ? AppColor.primary
                                  : nebengOrder.status == 3
                                      ? AppColor.doneTextColor
                                      : AppColor.errorColor),
                    ),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {
              controller.ourWa(nebengOrder.users?.phone);
            },
            icon: SvgPicture.asset(
              AppIcons.contWhatsapp,
              color: AppColor.successColor,
            ),
            iconSize: IconSizes.sm,
          )
        ],
      ),
    );
  }
}
