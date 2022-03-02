import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
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
            padding: EdgeInsets.only(top: 10),
            child: Image.asset(
              "assets/logo/logo-besar.png",
              width: Get.width * 0.45,
            ),
          ),
          CardRoundedBorder(
            height: Get.height * 0.25,
            color: AppColor.primaryColor,
            borderRadius: 30,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Obx(
              () => Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: AppColor.transparentColor,
                              backgroundImage:
                                  AssetImage("assets/images/fajrie.JPG"),
                              radius: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  controller.name.value,
                                  style: TextStyles.textTitle,
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: <Widget>[
                            //     Container(
                            //       height: size.height * 0.095,
                            //       child: Column(
                            //         children: <Widget>[
                            //           Container(
                            //             width: size.width / 4,
                            //             height: size.height * 0.025,
                            //             child: Center(
                            //               child: Text(
                            //                 "MITRA RIDER",
                            //                 style: TextStyles.textStatWhite,
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //             ),
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(15),
                            //               color: Colors.black,
                            //             ),
                            //           ),
                            //           Spacer(),
                            //           Container(
                            //             width: size.width / 4,
                            //             height: size.height * 0.025,
                            //             child: Center(
                            //               child: Text(
                            //                 "AKTIF",
                            //                 style: TextStyles.textStatWhite,
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //             ),
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(15),
                            //               color: AppColor.successColor,
                            //             ),
                            //           ),
                            //           Spacer(),
                            //           Container(
                            //             width: size.width / 4,
                            //             height: size.height * 0.025,
                            //             child: Center(
                            //               child: Text(
                            //                 "SIAP JEMPUT",
                            //                 style: TextStyles.textStatWhite,
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //             ),
                            //             decoration: BoxDecoration(
                            //               borderRadius: BorderRadius.circular(15),
                            //               color: AppColor.successColor,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
          Spacer(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 3),
                width: Get.width * 0.9,
                child: Text(
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
