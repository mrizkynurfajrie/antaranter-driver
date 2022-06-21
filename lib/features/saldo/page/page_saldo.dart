import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/saldo/controller_saldo.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/currency_formatter.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PageSaldo extends GetView<ControllerSaldo> {
  const PageSaldo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'SALDO',
      toolbarTitleColor: AppColor.bgPageColor,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: true,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          await controller.refreshData();
        },
        child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CardRoundedBorder(
                      color: AppColor.whiteColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 15.w),
                      borderRadius: 9,
                      borderColor: AppColor.primaryColor,
                      borderWidth: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
                            ],
                          ),
                          verticalSpace(35.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CardRounded(
                              shadow: Shadows.none,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    controller.controllerRiderInfo.rider.value
                                                .name !=
                                            null
                                        ? controller.controllerRiderInfo.rider
                                            .value.name!
                                            .toUpperCase()
                                        : "-",
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s18,
                                      color: AppColor.neutral,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       "+62",
                                  //       style: TextStyles.inter.copyWith(
                                  //         fontSize: FontSizes.s14,
                                  //         color: AppColor.neutral,
                                  //       ),
                                  //     ),
                                  //     Text(
                                  //       controller.controllerRiderInfo.rider.value
                                  //               .phone ??
                                  //           "-",
                                  //       style: TextStyles.inter.copyWith(
                                  //         fontSize: FontSizes.s14,
                                  //         color: AppColor.neutral,
                                  //       ),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(15.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ButtonSaldo(
                                icon: AppIcons.icTopUp,
                                title: 'Isi Saldo',
                                ontap: () {
                                  Get.toNamed(Routes.topup);
                                },
                              ),
                            ],
                          ),
                          verticalSpace(5.h),
                          Obx(
                            () => controller.loading.isTrue
                                ? Shimmer.fromColors(
                                    baseColor: AppColor.neutral.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    enabled: controller.loading.isTrue,
                                    child: Container(
                                      width: 100.w,
                                      height: 40.w,
                                      decoration: BoxDecoration(
                                        borderRadius: Corners.lgBorder,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    CurrencyFormat.convertToIdr(
                                      controller.balance.value.currBalance,
                                      2,
                                    ),
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(10.h),
                    CardPrimary(
                      shadow: Shadows.universal,
                      width: Get.width,
                      height: Get.height * 0.50.h,
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
                                  color: controller
                                              .listTransaction[index].trxType ==
                                          1
                                      ? Colors.green
                                      : Colors.red,
                                  size: IconSizes.lg,
                                ),
                              ),
                              trailing: RichText(
                                  text: TextSpan(
                                      text: controller.listTransaction[index]
                                                  .trxType ==
                                              1
                                          ? ''
                                          : '-',
                                      style: TextStyles.textStd
                                          .copyWith(color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: CurrencyFormat.convertToIdr(
                                          controller
                                              .listTransaction[index].amount,
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
                              width: Get.width * 0.7.w,
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
              )
            ]),
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
      child: CardRounded(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: buttonWidth,
        shadow: Shadows.none,
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
