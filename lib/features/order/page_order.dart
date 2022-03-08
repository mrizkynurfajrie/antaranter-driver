import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:intake_rider/shared/widgets/cards/card_info.dart';
import 'package:intake_rider/shared/widgets/cards/card_item.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/inputs/input_icon_underlined.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'controller_order.dart';

class PageOrder extends GetView<ControllerOrder> {
  var seat = <ModelBottomsheet>[];
  const PageOrder({Key? key}) : super(key: key);

  getProvince() async {
    seat.add(ModelBottomsheet(widget: CardInfo));
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'IN-TAKE',
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: AppLogos.logoApp(AppLogos.logoColoured),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CardRounded(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          'Perjalanan',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(Insets.sm),
                      InputIconUnderline(
                        icon: Icon(
                          Icons.my_location_rounded,
                          size: IconSizes.med,
                          color: AppColor.greyColor,
                        ),
                        hintText: 'Kota Berangkat',
                        isDense: true,
                        onChange: (String) {},
                      ),
                      verticalSpace(Insets.med),
                      InputIconUnderline(
                        icon: Icon(
                          Icons.my_location_rounded,
                          size: IconSizes.med,
                          color: AppColor.primaryColor,
                        ),
                        hintText: 'Kota Tujuan',
                        isDense: true,
                        onChange: (String) {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(Insets.med),
                CardRounded(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          'Informasi Kendaraan',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(Insets.sm),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.car_rental_rounded,
                            color: AppColor.primaryColor,
                            size: IconSizes.med,
                          ),
                          horizontalSpace(16),
                          Text(
                            'Kijang Innova',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColorLight,
                            ),
                          )
                        ],
                      ),
                      verticalSpace(Insets.sm),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.card_travel,
                            color: AppColor.primaryColor,
                            size: IconSizes.med,
                          ),
                          horizontalSpace(16),
                          Text(
                            'KT 3322 SS',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColorLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(Insets.med),
                CardItem(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(
                          'Detail Perjalanan',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
