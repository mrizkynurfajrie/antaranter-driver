import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/nebeng_posting_detail/controller_nebeng_posting_detail.dart';
import 'package:intake_rider/response/nebeng_order.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/currency_formatter.dart';
import 'package:intake_rider/shared/helpers/format_date_time.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/others/loading_indicator.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageNebengPostingDetail extends GetView<ControllerNebengPostingDetail> {
  const PageNebengPostingDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'IN-TAKE',
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: AppLogos.logoApp(AppLogos.logoColoured),
      child: Obx(
        () => controller.loading.isFalse
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardRounded(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: Get.width * 0.32.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.car_rental,
                                          size: IconSizes.med,
                                          color: AppColor.primaryColor,
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
                                          style: TextStyles.inter.copyWith(
                                            fontSize: FontSizes.s14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.greyColorLight,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.perm_identity,
                                        size: IconSizes.med,
                                        color: AppColor.primaryColor,
                                      ),
                                      horizontalSpace(5.w),
                                      Text(
                                        controller.controllerPostingan.postingan
                                                .value.nebengPosting?.seatAvail
                                                .toString() ??
                                            '',
                                        style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.greyColorLight,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    controller.controllerPostingan.postingan
                                            .value.nebengPosting?.price ??
                                        0,
                                    0),
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyColorLight,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(9.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.30.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      CupertinoIcons.color_filter,
                                      size: IconSizes.med,
                                      color: AppColor.primaryColor,
                                    ),
                                    horizontalSpace(5.w),
                                    Text(
                                      controller.controllerPostingan.postingan
                                              .value.nebengRider?.platNumber
                                              .toString() ??
                                          '',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.greyColorLight,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              horizontalSpace(9.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.color_filter,
                                    size: IconSizes.med,
                                    color: AppColor.primaryColor,
                                  ),
                                  horizontalSpace(5.w),
                                  Text(
                                    controller.controllerPostingan.postingan
                                            .value.nebengRider?.vehicleColor
                                            .toString() ??
                                        '',
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.greyColorLight,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(15.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
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
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s14,
                                        color: AppColor.greyColor,
                                        fontWeight: FontWeight.w400,
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
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15.w,
                                child: Text(
                                  controller.controllerPostingan.postingan.value
                                      .nebengPosting!.timeDep!
                                      .toString(),
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(
                                    Icons.my_location,
                                    size: IconSizes.med,
                                    color: AppColor.primaryColor,
                                  ),
                                  horizontalSpace(5.w),
                                  SizedBox(
                                    width: Get.width * 0.323.w,
                                    child: Text(
                                      controller
                                              .controllerPostingan
                                              .postingan
                                              .value
                                              .nebengPosting
                                              ?.cityDestination
                                              .toString() ??
                                          '',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s14,
                                        color: AppColor.greyColor,
                                        fontWeight: FontWeight.w400,
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
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15.w,
                                child: Text(
                                  controller.controllerPostingan.postingan.value
                                      .nebengPosting!.timeArr!
                                      .toString(),
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(15.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height: Get.height * 0.10.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ButtonPrimary(
                              onPressed: () {
                                controller.dialogUbah();
                              },
                              label: 'Ubah Waktu Perjalanan',
                              color: AppColor.whiteColor,
                              labelStyle: TextStyles.inter.copyWith(
                                color: AppColor.primaryColor,
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
                                onPressed: () {},
                                label: 'Batalkan Perjalanan',
                                color: AppColor.errorColor,
                                labelStyle: TextStyles.inter.copyWith(
                                  color: AppColor.whiteColor,
                                  fontSize: FontSizes.s14,
                                  fontWeight: FontWeight.w500,
                                ),
                                height: Get.height * 0.08,
                                cornerRadius: 4),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(Insets.xl),
                    Container(
                      height: Get.height * 0.35,
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                      child: controller.obx(
                        (state) => ListView.builder(
                          itemBuilder: (context, index) => UserNebeng(
                              nebengOrder: controller.listUserNebeng[index]),
                          itemCount: controller.listUserNebeng.length,
                        ),
                      ),
                    ),
                  ],
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
          Text(
            '#12345',
            style: TextStyles.inter.copyWith(
              fontSize: FontSizes.s14,
              fontWeight: FontWeight.w400,
              color: AppColor.greyColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
