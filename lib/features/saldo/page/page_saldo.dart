import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/saldo/controller_saldo.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/currency_formatter.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PageSaldo extends GetView<ControllerSaldo> {
  const PageSaldo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Saldo',
      center: null,
      centerTitle: true,
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.primaryColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: true,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: Get.width,
            height: Get.height * 0.23.h,
            child: SvgPicture.asset(
              AppIcons.saldoframe,
              fit: BoxFit.cover,
            ),
          ),
          RefreshIndicator(
            color: AppColor.primaryColor,
            onRefresh: () async {
              await controller.refreshData();
            },
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20.h, left: 20.w),
                    child: Obx(
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
                                0,
                              ),
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s36,
                                fontWeight: FontWeight.w400,
                                color: AppColor.whiteColor,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, top: 10.h),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.topup);
                      },
                      child: Text(
                        'Isi Saldo',
                        style: TextStyles.inter.copyWith(
                          fontSize: FontSizes.s14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColor.transparentColor,
                          onPrimary: AppColor.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(90),
                              side: const BorderSide(
                                width: 1,
                                color: AppColor.whiteColor,
                              ))),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 20.h),
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.w, top: 20.h, bottom: 20.h),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Transaksi',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CardPrimary(
                              shadow: Shadows.universal,
                              width: Get.width,
                              height: Get.height * 0.50.h,
                              color: AppColor.whiteColor,
                              child: controller.obx(
                                (state) => Scrollbar(
                                  child: ListView.builder(
                                    controller: controller.scrollController,
                                    itemCount:
                                        controller.listTransaction.length,
                                    itemBuilder: (context, index) => Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: AppColor.disableText,
                                                  width: 1))),
                                      child: ListTile(
                                        title: Text(
                                          controller.listTransaction[index]
                                                      .trxType ==
                                                  1
                                              ? "Isi Saldo"
                                              : "Pembayaran",
                                          style: TextStyles.inter.copyWith(
                                            fontSize: FontSizes.s14,
                                            color: AppColor.neutral,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Text(
                                            FormatDateTime.formatDateLocale(
                                                controller
                                                    .listTransaction[index]
                                                    .datetimeSaldo
                                                    .toString())),
                                        trailing: RichText(
                                            text: TextSpan(
                                                text: controller
                                                            .listTransaction[
                                                                index]
                                                            .trxType ==
                                                        1
                                                    ? '+ '
                                                    : '- ',
                                                style: TextStyles.inter.copyWith(
                                                    fontSize: FontSizes.s14,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller
                                                                .listTransaction[
                                                                    index]
                                                                .trxType ==
                                                            1
                                                        ? AppColor.doneTextColor
                                                        : AppColor
                                                            .transactionColor),
                                                children: [
                                              TextSpan(
                                                  text: CurrencyFormat
                                                      .convertToIdr(
                                                          controller
                                                              .listTransaction[
                                                                  index]
                                                              .amount,
                                                          0),
                                                  style: controller
                                                              .listTransaction[
                                                                  index]
                                                              .trxType ==
                                                          1
                                                      ? TextStyles.inter
                                                          .copyWith(
                                                              color: AppColor
                                                                  .doneTextColor)
                                                      : TextStyles.inter.copyWith(
                                                          color: AppColor
                                                              .transactionColor)),
                                            ])),
                                      ),
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
                                      child: Image.asset(
                                          'assets/icons/no_data.png'),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
