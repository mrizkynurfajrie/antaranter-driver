import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_icon.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/features/home/controller_home.dart';

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CustomIconButton(
                              ontap: () {},
                              icon: AppIcons.wallet,
                              title: 'Saldo',
                              iconColor: AppColor.primaryColor,
                              iconHeight: 32,
                              iconWidth: 32,
                            ),
                            CustomIconButton(
                              ontap: () {},
                              icon: AppIcons.history,
                              title: 'History',
                              iconColor: AppColor.primaryColor,
                              iconHeight: 25,
                              iconWidth: 25,
                            ),
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
          verticalSpace(25),
          Container(
            height: Get.height * 0.4,
            width: Get.width,
            color: AppColor.greyColorLight,
          ),
          const Spacer(),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                width: Get.width * 0.9,
                child: const Text(
                  "Order History",
                  style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
