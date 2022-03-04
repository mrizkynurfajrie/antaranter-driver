import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/saldo/controller_saldo.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CardPrimary(
              height: Get.height * 0.25,
              width: Get.width * 0.9,
              color: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              radius: 19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: Get.width * 0.30,
                        child: AppLogos.logoApp(AppLogos.logoUncoloured),
                      ),
                    ],
                  ),
                  verticalSpace(15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: Get.width * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'mrizkynurfajrie',
                            style: TextStyles.textTitle,
                          ),
                          Text(
                            '085250505050',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              color: AppColor.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Rp 0,-',
                          style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s32,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whiteColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ButtonSaldo(
                  icon: AppIcons.icTopUp,
                  title: 'Isi Ulang',
                  buttonHeight: Get.height * 0.10,
                  buttonWidth: 100,
                  ontap: () {},
                ),
                ButtonSaldo(
                  icon: AppIcons.icWithdrawl,
                  title: 'Tarik Dana',
                  buttonHeight: Get.height * 0.10,
                  buttonWidth: 100,
                  ontap: () {},
                ),
              ],
            ),
          ],
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
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: buttonHeight,
        width: buttonWidth,
        shadow: Shadows.universal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              color: AppColor.whiteColor,
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpace(7),
            Text(
              title,
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s14,
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

class CardHistory extends StatelessWidget {
  const CardHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
