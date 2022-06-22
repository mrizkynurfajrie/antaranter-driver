import 'dart:developer';

import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
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
      toolbarTitleColor: AppColor.whiteColor,
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.primaryColor,
      toolbarElevation: 2,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: Center(
          child: Text('Aktifitas Nebeng',
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s16,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w500,
              ))),
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
                            SliverToBoxAdapter(
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
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 15.w),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Titik Awal',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s12,
                                                        color: AppColor
                                                            .disableText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    verticalSpace(5.h),
                                                    Text(
                                                      controller
                                                              .controllerPostingan
                                                              .postingan
                                                              .value
                                                              .nebengPosting
                                                              ?.cityOrigin ??
                                                          '',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColor.neutral,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Tanggal Berangkat',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s12,
                                                        color: AppColor
                                                            .disableText,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                                FontSizes.s14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColor
                                                                .neutral,
                                                          ),
                                                        ),
                                                        horizontalSpace(5.w),
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
                                                                  FontSizes.s14,
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
                                          verticalSpace(10.h),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Tujuan',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s12,
                                                        color: AppColor
                                                            .disableText,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    verticalSpace(5.h),
                                                    Text(
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
                                                        fontSize: FontSizes.s14,
                                                        color: AppColor.neutral,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Kursi',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s12,
                                                        color: AppColor
                                                            .disableText,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                                text: "Penuh",
                                                                style: TextStyles
                                                                    .inter
                                                                    .copyWith(
                                                                  fontSize:
                                                                      FontSizes
                                                                          .s14,
                                                                  color: AppColor
                                                                      .errorColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              )
                                                            : TextSpan(
                                                                text: "${controller.controllerPostingan.postingan.value.nebengOrder!.length}"
                                                                        .isEmpty
                                                                    ? "0"
                                                                    : "${controller.controllerPostingan.postingan.value.nebengOrder!.length}",
                                                                style: TextStyles
                                                                    .inter
                                                                    .copyWith(
                                                                  fontSize:
                                                                      FontSizes
                                                                          .s14,
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
                                                                  )
                                                                ],
                                                              )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: AppColor.divider.shade200,
                                          ),
                                          Text(
                                            'Harga',
                                            style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s12,
                                              color: AppColor.disableText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          verticalSpace(5.h),
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
                                            style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.neutral,
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                            color: AppColor.divider.shade200,
                                          ),
                                          verticalSpace(5.h),
                                          Text(
                                            'Catatan Perjalanan',
                                            style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s12,
                                              color: AppColor.disableText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          verticalSpace(5.h),
                                          Text(
                                            controller
                                                    .controllerPostingan
                                                    .postingan
                                                    .value
                                                    .nebengPosting
                                                    ?.desc
                                                    .toString() ??
                                                '',
                                            style: TextStyles.inter.copyWith(
                                              fontSize: FontSizes.s14,
                                              color: AppColor.neutral,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(5.h),
                                    //list user//
                                    Container(
                                      height: Get.height * 0.25.h,
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

                                    //tombol//
                                    // verticalSpace(10.h),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonPrimary(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          onPressed: () {
                                            controller.dialogBatal();
                                          },
                                          enable:
                                              (controller.statusNebeng.value ==
                                                      1)
                                                  ? true
                                                  : false,
                                          label: 'Batalkan Perjalanan',
                                          color: AppColor.redButton,
                                          labelStyle: TextStyles.inter.copyWith(
                                            color: AppColor.whiteColor,
                                            fontSize: FontSizes.s14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          height: Get.height * 0.06.h,
                                          cornerRadius: 8,
                                          borderColor: AppColor.errorColor,
                                        ),
                                        verticalSpace(8.h),
                                        ButtonPrimary(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          onPressed: () {
                                            controller.dialogUbah();
                                          },
                                          label: 'Ubah Waktu Perjalanan',
                                          // enable: controller.checkAvailableButton(),
                                          enable:
                                              (controller.statusNebeng.value ==
                                                      1)
                                                  ? true
                                                  : false,
                                          color: AppColor.whiteColor,
                                          labelStyle: TextStyles.inter.copyWith(
                                            color: (controller
                                                        .statusNebeng.value ==
                                                    1)
                                                ? AppColor.primaryColor
                                                : AppColor.whiteColor,
                                            fontSize: FontSizes.s14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          height: Get.height * 0.06.h,
                                          cornerRadius: 8,
                                          borderColor: AppColor.primaryColor,
                                        ),
                                      ],
                                    ),
                                    verticalSpace(10.h),
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
                                                    ? () {
                                                        controller
                                                            .ubahStatus(2);
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
                                    verticalSpace(5.h),
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
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
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
                  CardRounded(
                    shadow: Shadows.none,
                    padding: EdgeInsets.zero,
                    child: Text(
                      '${nebengOrder.users?.username}',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.neutral,
                      ),
                    ),
                  ),
                  verticalSpace(2),
                  Row(
                    children: [
                      CardRounded(
                          shadow: Shadows.none,
                          padding: EdgeInsets.zero,
                          child: '${nebengOrder.users?.gender}' == 'male'
                              ? AppIcons.iconApp(AppIcons.genderMale,
                                  AppColor.genderMale, IconSizes.xs)
                              : AppIcons.iconApp(AppIcons.genderFemale,
                                  AppColor.genderFemale, IconSizes.xs)),
                      CardRounded(
                        shadow: Shadows.none,
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text(
                              "+62",
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.disableText,
                              ),
                            ),
                            Text(
                              '${nebengOrder.users?.phone}',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.disableText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
          // IconButton(
          //   onPressed: () {
          //     controller.ourWa(nebengOrder.users?.phone);
          //   },
          //   icon: SvgPicture.asset(
          //     AppIcons.contWhatsapp,
          //     color: AppColor.successColor,
          //   ),
          //   iconSize: IconSizes.sm,
          // )
          InkWell(
            child: Row(
              children: [
                Text(
                  'Hubungi',
                  style: TextStyles.inter.copyWith(
                    fontSize: FontSizes.s10,
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral,
                  ),
                ),
                horizontalSpace(3.w),
                Icon(
                  Icons.arrow_forward_ios,
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
    );
  }
}
