import 'dart:developer';

import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
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
                                                      ButtonText(
                                                        label:
                                                            'Ubah Waktu Perjalanan',
                                                        textStyle: TextStyles
                                                            .inter
                                                            .copyWith(
                                                          fontSize:
                                                              FontSizes.s12,
                                                          color: controller
                                                                      .statusNebeng
                                                                      .value ==
                                                                  1
                                                              ? AppColor
                                                                  .whiteColor
                                                              : AppColor
                                                                  .disableText,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                            padding:
                                                EdgeInsets.only(right: 8.w),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: ButtonText(
                                                label: 'Batalkan Perjalanan',
                                                textStyle:
                                                    TextStyles.inter.copyWith(
                                                  fontSize: FontSizes.s12,
                                                  fontWeight: FontWeight.w500,
                                                  color: controller.statusNebeng
                                                              .value ==
                                                          1
                                                      ? AppColor.errorColor
                                                      : AppColor.disableText,
                                                ),
                                                onPressed: () {
                                                  controller.statusNebeng
                                                              .value ==
                                                          1
                                                      ? controller.dialogBatal()
                                                      : null;
                                                },
                                              ),
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
                                      height: 150.h,
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
                                                  showPopUpChoice(
                                                      imageUri:
                                                          PopUpIcons.success,
                                                      imageSize: IconSizes.xl,
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
    return CardRounded(
      color: AppColor.cardDetailBody,
      width: Get.width * 0.65.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: Column(
        children: [
          Row(
            children: [
              CardRoundedTop(
                borderRadius: 8,
                margin: EdgeInsets.zero,
                width: Get.width * 0.65.w,
                color: AppColor.primaryColor,
                child: Row(
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
                                  color:
                                      '${nebengOrder.users?.gender}' == 'male'
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
                    horizontalSpace(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(2),
                        SizedBox(
                          width: Get.width * 0.40.w,
                          child: Text(
                            '${nebengOrder.users?.username}',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                        verticalSpace(2),
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.40.w,
                              child: Text(
                                '${nebengOrder.users?.gender}' == 'male'
                                    ? 'Laki-Laki'
                                    : 'Perempuan',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s12,
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.58.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "+62",
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.neutral,
                                ),
                              ),
                              Text(
                                '${nebengOrder.users?.phone}',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.neutral,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                Text(
                                  'Hubungi',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.neutral,
                                  ),
                                ),
                                horizontalSpace(3.w),
                                Icon(
                                  CupertinoIcons.phone_fill,
                                  size: 12.w,
                                )
                              ],
                            ),
                            onTap: () {
                              controller.ourWa(nebengOrder.users?.phone);
                            },
                          )
                        ],
                      ),
                    ),
                    verticalSpace(5.h),
                    CardRounded(
                      shadow: Shadows.none,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
