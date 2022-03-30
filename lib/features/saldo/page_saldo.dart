import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/saldo/controller_saldo.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/currency_formatter.dart';
import 'package:intake_rider/shared/helpers/format_date_time.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/others/loading_indicator.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PageSaldo extends GetView<ControllerSaldo> {
  const PageSaldo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'SALDO',
      toolbarTitleColor: AppColor.neutral.shade900,
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      enableBack: true,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          await controller.refreshData();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CardPrimary(
                height: Get.height * 0.25.h,
                width: Get.width * 0.87.w,
                color: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                radius: 19,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: Get.width * 0.30.w,
                          child: AppLogos.logoApp(AppLogos.logoUncoloured),
                        ),
                      ],
                    ),
                    verticalSpace(15.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: Get.width * 0.33.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.controllerRiderInfo.rider.value.name ??
                                  "-",
                              style: TextStyles.textTitle,
                            ),
                            Text(
                              controller
                                      .controllerRiderInfo.rider.value.phone ??
                                  "-",
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s14,
                                color: AppColor.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(20.h),
                    Obx(
                      () => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade50,
                        enabled: controller.loading.isTrue,
                        child: controller.loading.isTrue
                            ? Container(
                                width: 100.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius: Corners.lgBorder,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                CurrencyFormat.convertToIdr(
                                  controller.balance.value.currBalance,
                                  2,
                                ),
                                style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.whiteColor),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonSaldo(
                      icon: AppIcons.icTopUp,
                      title: 'Isi Ulang',
                      buttonHeight: 55.h,
                      buttonWidth: 105.w,
                      ontap: () {
                        
                      },
                    ),
                  ],
                ),
              ),
              verticalSpace(15.h),
              CardPrimary(
                width: Get.width * 0.9.h,
                height: Get.height * 0.45.h,
                color: AppColor.whiteColor,
                child: controller.obx(
                  (state) => Scrollbar(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.listTransaction.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          controller.listTransaction[index].trxType == 1
                              ? "Top Up"
                              : "Transaksi",
                          style: TextStyles.body1,
                        ),
                        subtitle: Text(
                            "${FormatDateTime.formatDateLocale(controller.listTransaction[index].datetimeSaldo.toString())} . ${FormatDateTime.formatTime(dateString: controller.listTransaction[index].datetimeSaldo.toString())}"),
                        leading: CardRoundedBorder(
                          padding: EdgeInsets.zero,
                          width: IconSizes.xl,
                          child: Icon(
                            controller.listTransaction[index].trxType == 1
                                ? CupertinoIcons.plus
                                : CupertinoIcons.car_detailed,
                            color:
                                controller.listTransaction[index].trxType == 1
                                    ? Colors.green
                                    : Colors.red,
                            size: IconSizes.lg,
                          ),
                        ),
                        trailing: RichText(
                            text: TextSpan(
                                text:
                                    controller.listTransaction[index].trxType ==
                                            1
                                        ? ''
                                        : '-',
                                style: TextStyles.textStd
                                    .copyWith(color: Colors.black),
                                children: [
                              TextSpan(
                                text: CurrencyFormat.convertToIdr(
                                    controller.listTransaction[index].amount,
                                    0),
                              ),
                            ])),
                      ),
                    ),
                  ),
                  onLoading: loadingIndicatorBottom(context),
                  onEmpty: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: IconSizes.xxl,
                        width: IconSizes.xxl,
                        child: Image.asset('assets/icons/no_data.png'),
                      ),
                      verticalSpace(5.h),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                            'Anda belum memiliki transaksi, silakan lakukan isi ulang saldo',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  onError: (e) {
                    return const Text("Something wrong");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonSaldo extends StatelessWidget {
  final Function() ontap;
  final String icon;
  final String title;
  final double? buttonHeight;
  final double? buttonWidth;

  const ButtonSaldo({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CardRoundedBorder(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
        height: buttonHeight,
        width: buttonWidth,
        shadow: Shadows.universal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              color: AppColor.whiteColor,
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            horizontalSpace(7.h),
            Text(
              title,
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
