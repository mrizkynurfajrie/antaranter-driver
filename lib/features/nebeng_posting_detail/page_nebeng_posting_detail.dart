import 'dart:developer';

import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary_outline.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_top.dart';
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
      resizeAvoidBottom: false,
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.bgPageColor,
      toolbarElevation: 2,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: Center(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
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
                              child: CardRounded(
                                color: AppColor.bgPageColor,
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.zero,
                                shadow: Shadows.none,
                                child: Column(
                                  children: [
                                    //card info//
                                    CardRounded(
                                      color: AppColor.whiteColor,
                                      borderRadius: 0,
                                      width: Get.width,
                                      shadow: Shadows.none,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.h, horizontal: 5.w),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Column(
                                        children: [
                                          CardRounded(
                                            shadow: Shadows.universal,
                                            color: AppColor.cardDetailBody,
                                            width: Get.width,
                                            padding: EdgeInsets.only(
                                                top: 0.h,
                                                left: 0.w,
                                                right: 0.w,
                                                bottom: 10.h),
                                            margin: EdgeInsets.only(
                                                top: 10.h,
                                                left: 5.w,
                                                right: 5.w,
                                                bottom: 3.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                CardRoundedTop(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w,
                                                      vertical: 5.h),
                                                  width: Get.width,
                                                  margin: EdgeInsets.zero,
                                                  color: AppColor.primaryColor,
                                                  borderRadius: 8,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Harga',
                                                            style: TextStyles
                                                                .inter
                                                                .copyWith(
                                                              fontSize:
                                                                  FontSizes.s12,
                                                              color: AppColor
                                                                  .whiteColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          verticalSpace(3.h),
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
                                                            style: TextStyles
                                                                .inter
                                                                .copyWith(
                                                              fontSize:
                                                                  FontSizes.s16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColor
                                                                  .whiteColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                verticalSpace(6.h),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10.h,
                                                      left: 10.w,
                                                      right: 10.w,
                                                      bottom: 3.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Titik Awal',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s12,
                                                                color: AppColor
                                                                    .disableText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            verticalSpace(3.h),
                                                            Text(
                                                              controller
                                                                      .controllerPostingan
                                                                      .postingan
                                                                      .value
                                                                      .nebengPosting
                                                                      ?.cityOrigin ??
                                                                  '',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColor
                                                                    .neutral,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      horizontalSpace(40.w),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tanggal Berangkat',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s12,
                                                                color: AppColor
                                                                    .disableText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            verticalSpace(5.h),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  FormatDateTime.formatDateWithoutHour(
                                                                          value: controller
                                                                              .controllerPostingan
                                                                              .postingan
                                                                              .value
                                                                              .nebengPosting!
                                                                              .dateDep!) +
                                                                      ','.toString(),
                                                                  style: TextStyles
                                                                      .inter
                                                                      .copyWith(
                                                                    fontSize:
                                                                        FontSizes
                                                                            .s14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: AppColor
                                                                        .neutral,
                                                                  ),
                                                                ),
                                                                horizontalSpace(
                                                                    5.w),
                                                                Obx(
                                                                  () => Text(
                                                                    controller
                                                                        .controllerPostingan
                                                                        .postingan
                                                                        .value
                                                                        .nebengPosting!
                                                                        .timeDep!
                                                                        .toString(),
                                                                    style: TextStyles
                                                                        .inter
                                                                        .copyWith(
                                                                      fontSize:
                                                                          FontSizes
                                                                              .s14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColor
                                                                          .neutral,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                verticalSpace(10.h),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 0.h,
                                                      horizontal: 10.w),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tujuan',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s12,
                                                                color: AppColor
                                                                    .disableText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            verticalSpace(3.h),
                                                            Text(
                                                              controller
                                                                      .controllerPostingan
                                                                      .postingan
                                                                      .value
                                                                      .nebengPosting
                                                                      ?.cityDestination
                                                                      .toString() ??
                                                                  '',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s14,
                                                                color: AppColor
                                                                    .neutral,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      horizontalSpace(40.w),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Kursi',
                                                              style: TextStyles
                                                                  .inter
                                                                  .copyWith(
                                                                fontSize:
                                                                    FontSizes
                                                                        .s12,
                                                                color: AppColor
                                                                    .disableText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            verticalSpace(5.h),
                                                            RichText(
                                                                text: controller
                                                                            .controllerPostingan
                                                                            .postingan
                                                                            .value
                                                                            .nebengPosting!
                                                                            .seatAvail ==
                                                                        controller
                                                                            .controllerPostingan
                                                                            .postingan
                                                                            .value
                                                                            .nebengOrder!
                                                                            .length
                                                                    ? TextSpan(
                                                                        text:
                                                                            "Penuh",
                                                                        style: TextStyles
                                                                            .inter
                                                                            .copyWith(
                                                                          fontSize:
                                                                              FontSizes.s14,
                                                                          color:
                                                                              AppColor.errorColor,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      )
                                                                    : TextSpan(
                                                                        text: "${controller.controllerPostingan.postingan.value.nebengOrder!.length}".isEmpty
                                                                            ? "0"
                                                                            : "${controller.controllerPostingan.postingan.value.nebengOrder!.length}",
                                                                        style: TextStyles
                                                                            .inter
                                                                            .copyWith(
                                                                          fontSize:
                                                                              FontSizes.s14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              AppColor.greyColorLight,
                                                                        ),
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                "/${controller.controllerPostingan.postingan.value.nebengPosting!.seatAvail}",
                                                                            style:
                                                                                TextStyles.inter.copyWith(
                                                                              fontSize: FontSizes.s14,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: AppColor.greyColor,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                verticalSpace(10.h),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3.h,
                                                      left: 10.w,
                                                      right: 10.w,
                                                      bottom: 0.h),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Catatan Perjalanan',
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s12,
                                                          color: AppColor
                                                              .disableText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      verticalSpace(3.h),
                                                      Text(
                                                        controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting
                                                                ?.desc
                                                                .toString() ??
                                                            '',
                                                        maxLines: 2,
                                                        style: TextStyles.inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s14,
                                                          color:
                                                              AppColor.neutral,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ButtonPrimary(
                                                  height: 32.h,
                                                  size: 145.w,
                                                  cornerRadius: 8,
                                                  color: AppColor.batalButton,
                                                  label: 'Batalkan',
                                                  labelStyle:
                                                      TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s12,
                                                    fontWeight: FontWeight.w500,
                                                    color: controller
                                                                .statusNebeng
                                                                .value ==
                                                            1
                                                        ? AppColor
                                                            .batalButtonText
                                                        : AppColor.disableText,
                                                  ),
                                                  onPressed: () {
                                                    controller.statusNebeng
                                                                .value ==
                                                            1
                                                        ? controller
                                                            .dialogBatal()
                                                        : null;
                                                  },
                                                ),
                                                horizontalSpace(5.w),
                                                ButtonPrimary(
                                                  label: 'Ubah Waktu',
                                                  color: AppColor.ubahButton,
                                                  size: 145.w,
                                                  height: 32.h,
                                                  cornerRadius: 8,
                                                  labelStyle:
                                                      TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s12,
                                                    color: controller
                                                                .statusNebeng
                                                                .value ==
                                                            1
                                                        ? AppColor
                                                            .ubahButtonText
                                                        : AppColor.disableText,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  onPressed: () {
                                                    controller.statusNebeng
                                                                .value ==
                                                            1
                                                        ? controller
                                                            .dialogUbah()
                                                        : null;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(7.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13.w),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Text(
                                              'Penumpang',
                                              style: TextStyles.inter.copyWith(
                                                  fontSize: FontSizes.s12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.greyColor),
                                            ),
                                            horizontalSpace(3.w),
                                            Text(
                                              '(${controller.controllerPostingan.postingan.value.nebengOrder!.length.toString()})',
                                              style: TextStyles.inter.copyWith(
                                                  fontSize: FontSizes.s12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.greyColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    verticalSpace(5.h),
                                    //list user//
                                    Container(
                                      height: 170.h,
                                      width: Get.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: Insets.sm),
                                      child: controller.obx(
                                        (state) => ListView.builder(
                                          scrollDirection: Axis.horizontal,
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
                                    // verticalSpace(30.h),
                                    const Spacer(),
                                    //tombolbawah//
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 56.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: DottedBorder(
                                              dashPattern: const [12, 4],
                                              strokeWidth: 1,
                                              strokeCap: StrokeCap.round,
                                              color: AppColor.greyColorLight,
                                              borderType: BorderType.RRect,
                                              radius: const Radius.circular(8),
                                              child: ButtonPrimary(
                                                onPressed: controller
                                                        .listUserNebeng
                                                        .isNotEmpty
                                                    ? () async {
                                                        await controller
                                                            .ubahStatus(2);
                                                        controller.onRefresh();
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

                                                label: 'Mulai',
                                                color: AppColor.primaryColor,
                                                labelStyle:
                                                    TextStyles.inter.copyWith(
                                                  color: AppColor.whiteColor,
                                                  fontSize: FontSizes.s14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                height: 56.h,
                                                cornerRadius: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 56.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: DottedBorder(
                                              dashPattern: const [12, 4],
                                              strokeWidth: 1,
                                              strokeCap: StrokeCap.round,
                                              color: AppColor.greyColorLight,
                                              borderType: BorderType.RRect,
                                              radius: const Radius.circular(8),
                                              child: ButtonPrimary(
                                                onPressed: () {
                                                  Get.defaultDialog(
                                                    titlePadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 20.h),
                                                    title: 'Akhiri Perjalanan',
                                                    titleStyle: TextStyles.inter
                                                        .copyWith(
                                                      fontSize: FontSizes.s18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColor
                                                          .doneTextColor,
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 10.h),
                                                    content: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        PopUpIcons.iconApp(
                                                            PopUpIcons.success),
                                                        verticalSpace(10.h),
                                                        Text(
                                                          'Penumpang telah sampai di tujuan',
                                                          style: TextStyles
                                                              .inter
                                                              .copyWith(
                                                            fontSize:
                                                                FontSizes.s10,
                                                            color: AppColor
                                                                .forgotPass,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        verticalSpace(10.h),
                                                        Text(
                                                          'Anda ingin mengakhiri perjalanan nebeng ini?',
                                                          style: TextStyles
                                                              .inter
                                                              .copyWith(
                                                            fontSize:
                                                                FontSizes.s10,
                                                            color: AppColor
                                                                .forgotPass,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    confirm: ButtonPrimary(
                                                      label: 'Akhiri',
                                                      labelStyle: TextStyles
                                                          .inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        color:
                                                            AppColor.whiteColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      cornerRadius: 8,
                                                      height: 40.h,
                                                      size: 120.w,
                                                      color: AppColor
                                                          .doneTextColor,
                                                      onPressed: () async {
                                                        await controller
                                                            .ubahStatus(3);
                                                        Get.back();
                                                      },
                                                    ),
                                                    cancel:
                                                        ButtonPrimaryOutline(
                                                      label: 'Batal',
                                                      labelStyle: TextStyles
                                                          .inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        color: const Color(
                                                            0xFF616161),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      borderRadius: 8,
                                                      height: 40.h,
                                                      width: 120.w,
                                                      elevation: 0,
                                                      color: AppColor
                                                          .transparentColor,
                                                      outlineColor: AppColor
                                                          .outlineButton,
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  );
                                                },
                                                // onPressed: () {
                                                //   showPopUpChoice(
                                                //       imageUri:
                                                //           PopUpIcons.success,
                                                //       imageSize: IconSizes.xl,
                                                //       title:
                                                //           'Akhiri Perjalanan',
                                                //       titleStyle: TextStyles
                                                //           .inter
                                                //           .copyWith(
                                                //         fontSize: FontSizes.s18,
                                                //         fontWeight:
                                                //             FontWeight.w500,
                                                //         color: AppColor
                                                //             .doneTextColor,
                                                //       ),
                                                //       description:
                                                //           'Anda ingin mengakhiri perjalanan nebeng ini?',
                                                //       onConfirm: () async {
                                                //         await controller
                                                //             .ubahStatus(3);
                                                //         Get.back();
                                                //       },
                                                //       onCancel: () {
                                                //         Get.back();
                                                //       });
                                                // },
                                                label: 'Selesai',
                                                color: AppColor.successColor,
                                                enable: (controller.statusNebeng
                                                            .value ==
                                                        2)
                                                    ? true
                                                    : false,
                                                labelStyle:
                                                    TextStyles.inter.copyWith(
                                                  color: AppColor.whiteColor,
                                                  fontSize: FontSizes.s14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                height: 56.h,
                                                cornerRadius: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    verticalSpace(10.h),
                                  ],
                                ),
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
    return CardRoundedBorder(
      borderColor: AppColor.cardBorder,
      color: AppColor.cardDetailBody,
      borderRadius: 12,
      width: 157.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      log("gambar image : " +
                          nebengOrder.users!.image.toString());
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
                        height: IconSizes.listuser,
                        width: IconSizes.listuser,
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
                      SizedBox(
                        width: Get.width * 0.25.w,
                        child: Text(
                          '${nebengOrder.users?.username}',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.neutral,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(2),
                      Row(
                        children: [
                          SvgPicture.asset(
                            '${nebengOrder.users?.gender}' == 'male'
                                ? AppIcons.genderMale
                                : AppIcons.genderFemale,
                            width: IconSizes.genderIcon,
                          ),
                          horizontalSpace(5.w),
                          Row(
                            children: [
                              Text(
                                "+62",
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.disableText,
                                ),
                              ),
                              Text(
                                '${nebengOrder.users?.phone}',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s10,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.disableText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          verticalSpace(10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.30.w,
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
                          ? const Color(0xFFCD7B2E)
                          : nebengOrder.status == 2
                              ? AppColor.primary
                              : nebengOrder.status == 3
                                  ? AppColor.doneTextColor
                                  : AppColor.errorColor),
                ),
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Text(
                    nebengOrder.paymentType == 1 ? 'Tunai' : 'Non-Tunai',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s10,
                      color: AppColor.disableText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  horizontalSpace(5.w),
                  Text(
                    nebengOrder.paymentType == 1 ? '+ (Platform Fee)' : '',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s10,
                      color: AppColor.disableText,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              verticalSpace(5.h),
              Row(
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(
                      controller.controllerPostingan.postingan.value
                          .nebengPosting!.price,
                      0,
                    ),
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.neutral,
                    ),
                  ),
                  horizontalSpace(5.w),
                  Text(
                    nebengOrder.paymentType == 1 ? '+ Rp 2000' : '',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s10,
                      color: AppColor.disableText,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              verticalSpace(10.h),
            ],
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Hubungi',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s10,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primaryColor,
                  ),
                ),
                horizontalSpace(3.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 8.w,
                  color: AppColor.primaryColor,
                )
              ],
            ),
            onTap: () {
              controller.ourWa(nebengOrder.users?.phone);
            },
          ),
        ],
      ),
    );
  }
}
