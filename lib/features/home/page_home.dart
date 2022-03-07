import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_icon.dart';
import 'package:intake_rider/shared/widgets/buttons/button_text.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/features/home/controller_home.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'IN-TAKE RIDER',
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      enableBack: false,
      center: Align(
        alignment: Alignment.center,
        child: AppLogos.logoApp(AppLogos.logoColoured),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CardRoundedBorder(
            height: Get.height * 0.13,
            color: AppColor.primaryColor,
            borderRadius: 30,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Obx(
              () => Column(
                children: <Widget>[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CustomIconButton(
                              ontap: () {
                                Get.toNamed(Routes.saldo);
                              },
                              icon: AppIcons.wallet,
                              title: 'Saldo',
                              iconColor: AppColor.whiteColor,
                              iconHeight: 32,
                              iconWidth: 32,
                            ),
                            horizontalSpace(7),
                            CustomIconButton(
                              ontap: () {
                                Get.toNamed(Routes.actHistory);
                              },
                              icon: AppIcons.history,
                              title: 'Riwayat',
                              iconColor: AppColor.whiteColor,
                              iconHeight: 25,
                              iconWidth: 25,
                              iconPadding:
                                  const EdgeInsets.only(bottom: 4, top: 5),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: Get.width * 0.36,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'hai, ' + controller.name.value,
                                    style: TextStyles.textTitle,
                                    maxLines: 2,
                                  ),
                                  verticalSpace(5),
                                  Text(
                                    controller.phone.value,
                                    style: TextStyles.inter.copyWith(
                                      color: AppColor.whiteColor,
                                      fontSize: FontSizes.s14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor: AppColor.transparentColor,
                              backgroundImage:
                                  AssetImage("assets/images/fajrie.JPG"),
                              radius: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CardPrimary(
            height: Get.height * 0.24,
            width: Get.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '•',
                      style: TextStyles.textTableOrange,
                    ),
                    Image.asset(
                      AppIcons.carLocation,
                      height: 55,
                      width: 55,
                    ),
                    Text(
                      '•',
                      style: TextStyles.textTableOrange,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Buat perjalanan mu menghasilkan!',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InputPrimary(
                      boxWidth: 300,
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: AppColor.primaryColor,
                      ),
                      hintText: 'tentukan perjalanan mu',
                      keyboardType: TextInputType.none,
                      onTap: () {
                        Get.toNamed(Routes.order);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(Get.height * 0.18),
          CardPrimary(
            height: Get.height * 0.17,
            width: Get.width * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '•',
                      style: TextStyles.textTableOrange,
                    ),
                    Image.asset(
                      AppIcons.custService,
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      '•',
                      style: TextStyles.textTableOrange,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonText(
                      onPressed: () {},
                      label: 'Hubungi kami',
                      textStyle: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary.shade800,
                      ),
                    ),
                    Text(
                      'Butuh bantuan? Hubungi customer service kami dengan pelayanan 24/7',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
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
