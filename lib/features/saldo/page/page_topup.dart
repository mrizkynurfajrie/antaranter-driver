import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intake_rider/features/register/controller_register.dart';
import 'package:intake_rider/features/saldo/controller_saldo.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/helpers/currency_formatter.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/buttons/button_text.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/others/checkbox_label.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'dart:math' as math;

class PageTopUp extends GetView<ControllerSaldo> {
  const PageTopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageDecorationTop(
      title: 'Top Up Saldo',
      toolbarTitleColor: AppColor.whiteColor,
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: true,
      onBackPressed: () {
        controller.nominalTopUp.value = 50;
        Get.back();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Obx(
              () => Container(
                padding: EdgeInsets.all(Insets.med),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih nominal top up",
                      style: TextStyles.textStd,
                    ),
                    verticalSpace(Insets.med),
                    Row(
                      children: [
                        NominalWidget(
                          nominal: 50,
                          isSelected: controller.nominalTopUp.value == 50,
                          onTap: () {
                            controller.nominalTopUp.value = 50;
                          },
                        ),
                        horizontalSpace(Insets.sm),
                        NominalWidget(
                          nominal: 100,
                          isSelected: controller.nominalTopUp.value == 100,
                          onTap: () {
                            controller.nominalTopUp.value = 100;
                          },
                        ),
                        horizontalSpace(Insets.sm),
                        NominalWidget(
                          nominal: 200,
                          isSelected: controller.nominalTopUp.value == 200,
                          onTap: () {
                            controller.nominalTopUp.value = 200;
                          },
                        ),
                      ],
                    ),
                    verticalSpace(Insets.med),
                    Row(
                      children: [
                        NominalWidget(
                          nominal: 300,
                          isSelected: controller.nominalTopUp.value == 300,
                          onTap: () {
                            controller.nominalTopUp.value = 300;
                          },
                        ),
                        horizontalSpace(Insets.sm),
                        NominalWidget(
                          nominal: 500,
                          isSelected: controller.nominalTopUp.value == 500,
                          onTap: () {
                            controller.nominalTopUp.value = 500;
                          },
                        ),
                        horizontalSpace(Insets.sm),
                        NominalWidget(
                          nominal: 1000,
                          isSelected: controller.nominalTopUp.value == 1000,
                          onTap: () {
                            controller.nominalTopUp.value = 1000;
                          },
                        ),
                      ],
                    ),
                    verticalSpace(Insets.med),
                    Text(
                      "Nominal",
                      style: TextStyles.textStd,
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(
                        (controller.nominalTopUp.value * 1000),
                        0,
                      ),
                      style: TextStyles.text2xl,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(Insets.sm),
            Container(
              padding: EdgeInsets.all(Insets.med),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.money_dollar_circle_fill,
                        color: Colors.green,
                      ),
                      horizontalSpace(Insets.xs),
                      Text(
                        "Pembayaran",
                        style: TextStyles.textStd,
                      ),
                    ],
                  ),
                  verticalSpace(Insets.med),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppIcons.mandiri,
                        height: IconSizes.med,
                      ),
                      horizontalSpace(Insets.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bank Mandiri",
                              style: TextStyles.textStd,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Text(
                              "No. Rekening:",
                              style: TextStyles.textSm
                                  .copyWith(color: AppColor.neutral.shade600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "84254679452313213",
                                  style: TextStyles.textLg.copyWith(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                ButtonText(
                                  onPressed: () async {
                                    await Clipboard.setData(const ClipboardData(
                                        text: "84254679452313213"));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Copied to clipboard'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  label: "SALIN",
                                  color: Colors.greenAccent,
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Text(
                              "Jika sudah berhasil transfer,mohon untuk melakukan konfirmasi ke nomor WA 0811 xxx xxx xx",
                              style: TextStyles.textXs.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            verticalSpace(Insets.med),
                            Text(
                              "Hanya menerima pembayaran melalui bank Mandiri",
                              style: TextStyles.textXs
                                  .copyWith(color: AppColor.neutral.shade400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(Insets.sm),
            Container(
              padding: EdgeInsets.all(Insets.med),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandableNotifier(
                    child: ScrollOnExpand(
                      child: Column(
                        children: <Widget>[
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: true,
                              hasIcon: false,
                            ),
                            header: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Petunjuk Transfer ATM",
                                    style: TextStyles.textStd,
                                  ),
                                ),
                                ExpandableIcon(
                                  theme: const ExpandableThemeData(
                                    expandIcon: Icons.arrow_drop_down,
                                    collapseIcon: Icons.arrow_drop_up,
                                    iconColor: AppColor.greyColor,
                                    iconSize: 28.0,
                                    iconRotationAngle: math.pi / 2,
                                    iconPadding: EdgeInsets.only(right: 5),
                                    hasIcon: false,
                                  ),
                                ),
                              ],
                            ),
                            collapsed: Container(),
                            expanded: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Insets.xs,
                              ),
                              child: Column(
                                children: [
                                  ItemInstruction(
                                    numberOrder: "1",
                                    description: Text(
                                      "Pilih Transaksi Lain > Pembayaran > Lainnya > Mandiri E-money",
                                    ),
                                  ),
                                  ItemInstruction(
                                    numberOrder: "2",
                                    description: Text(
                                      "Masukkan nomor rekening",
                                    ),
                                  ),
                                  ItemInstruction(
                                    numberOrder: "3",
                                    description: Text(
                                      "Tekan kirim",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Insets.med),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandableNotifier(
                    child: ScrollOnExpand(
                      child: Column(
                        children: <Widget>[
                          ExpandablePanel(
                            theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: true,
                              hasIcon: false,
                            ),
                            header: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Petunjuk Transfer Mobile Banking",
                                    style: TextStyles.textStd,
                                  ),
                                ),
                                ExpandableIcon(
                                  theme: const ExpandableThemeData(
                                    expandIcon: Icons.arrow_drop_down,
                                    collapseIcon: Icons.arrow_drop_up,
                                    iconColor: AppColor.greyColor,
                                    iconSize: 28.0,
                                    iconRotationAngle: math.pi / 2,
                                    iconPadding: EdgeInsets.only(right: 5),
                                    hasIcon: false,
                                  ),
                                ),
                              ],
                            ),
                            collapsed: Container(),
                            expanded: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Insets.xs,
                              ),
                              child: Column(
                                children: [
                                  ItemInstruction(
                                    numberOrder: "1",
                                    description: Text(
                                      "Pilih Transaksi Lain > Pembayaran > Lainnya > Mandiri E-money",
                                    ),
                                  ),
                                  ItemInstruction(
                                    numberOrder: "2",
                                    description: Text(
                                      "Masukkan nomor rekening",
                                    ),
                                  ),
                                  ItemInstruction(
                                    numberOrder: "3",
                                    description: Text(
                                      "Tekan kirim",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonPrimary(
              margin: EdgeInsets.symmetric(
                horizontal: Insets.xs,
                vertical: Insets.xs,
              ),
              height: Sizes.xl,
              onPressed: () {
                controller.nominalTopUp.value = 50;
                Get.back();
              },
              label: "Ok",
              cornerRadius: Corners.sm,
            )
          ],
        ),
      ),
    );
  }
}

class ItemInstruction extends StatelessWidget {
  const ItemInstruction({
    Key? key,
    required this.numberOrder,
    required this.description,
  }) : super(key: key);

  final String numberOrder;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Insets.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardRoundedBorder(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: 5.w,
            ),
            width: 22.w,
            height: 22.w,
            child: Center(
              child: Text(
                numberOrder,
                style: TextStyles.textSm,
              ),
            ),
          ),
          horizontalSpace(Insets.xs),
          Expanded(
            child: description,
          ),
        ],
      ),
    );
  }
}

class NominalWidget extends StatelessWidget {
  const NominalWidget({
    Key? key,
    required this.onTap,
    required this.isSelected,
    required this.nominal,
  }) : super(key: key);

  final Function() onTap;
  final bool isSelected;
  final int nominal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: CardRoundedBorder(
          borderColor:
              isSelected ? AppColor.primaryColor : AppColor.bodyColor.shade300,
          padding: EdgeInsets.zero,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "$nominal",
                style: TextStyles.textXl.copyWith(
                  color: isSelected ? AppColor.primaryColor : Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ".000",
                    style: TextStyles.textSm,
                  ),
                ],
              ),
            ),
          ),
          height: 50.h,
        ),
      ),
    );
  }
}