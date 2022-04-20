import 'package:antaranter_driverapp/shared/controller/controller_postingan.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
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
        child: AppLogos.logoApp(AppLogos.logoHorizontal),
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
                            SliverToBoxAdapter(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //card info//
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.h, bottom: 5.h),
                                    child: CardRoundedBorder(
                                      borderColor: AppColor.greyColorLight,
                                      borderRadius: 9,
                                      borderWidth: 2,
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
                                                        Text(
                                                          controller
                                                                  .controllerPostingan
                                                                  .postingan
                                                                  .value
                                                                  .nebengPosting
                                                                  ?.seatAvail
                                                                  .toString() ??
                                                              '',
                                                          style: TextStyles
                                                              .inter
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
                                            verticalSpace(15.h),
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
                                            verticalSpace(5.h),
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
                                  // const Spacer(),
                                  //tombol//
                                  verticalSpace(10.h),
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
                                            enable: (controller
                                                        .statusNebeng.value ==
                                                    1)
                                                ? (controller.formattedTimeNow
                                                            .toString()
                                                            .compareTo(controller
                                                                .controllerPostingan
                                                                .postingan
                                                                .value
                                                                .nebengPosting!
                                                                .timeDep) <
                                                        2)
                                                    ? false
                                                    : true
                                                    // ? true
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
                                              onPressed: () async {
                                                await controller.ubahStatus(3);
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
                                                        .listUserNebeng
                                                        .isNotEmpty
                                                    ? () {
                                                        controller
                                                            .ubahStatus(2);
                                                      }
                                                    : () {
                                                        Get.snackbar(
                                                          "Perjalanan",
                                                          "Anda belum bisa memulai perjalanan, karena tidak ada pelanggan yang nebeng dengan anda",
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                        );
                                                      },
                                                enable: (controller.statusNebeng
                                                            .value ==
                                                        1)
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
                                            )),
                                      ),
                                    ],
                                  ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpace(2),
              Text(
                '${nebengOrder.users?.username}',
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor,
                ),
              ),
              verticalSpace(2),
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
