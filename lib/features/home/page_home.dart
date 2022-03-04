import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_icon.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/features/home/controller_home.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: AppLogos.logoApp(AppLogos.logoColoured),
          ),
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
                              ontap: () {},
                              icon: AppIcons.wallet,
                              title: 'Saldo',
                              iconColor: AppColor.whiteColor,
                              iconHeight: 32,
                              iconWidth: 32,
                            ),
                            horizontalSpace(7),
                            CustomIconButton(
                              ontap: () {},
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
          verticalSpace(15),
          CardPrimary(
            height: Get.height * 0.25,
            width: Get.width * 0.9,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'IN-TAKE',
                      style: TextStyles.textTableOrangeBold,
                    ),
                    Text(
                      'Nebeng • Titip',
                      style: TextStyles.textTableOrange,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Mau kemana hari ini?',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InputPrimary(
                      onChange: (value) {},
                      boxWidth: 300,
                      prefixIcon: Icon(
                        Icons.add_road_outlined,
                        color: AppColor.primaryColor,
                      ),
                      hintText: 'Tentukan perjalanan mu',
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
