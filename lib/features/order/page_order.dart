import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded_border.dart';
import 'package:intake_rider/shared/widgets/input_format/input_format_money.dart';
import 'package:intake_rider/shared/widgets/inputs/input_date.dart';
import 'package:intake_rider/shared/widgets/inputs/input_icon_underlined.dart';
import 'package:intake_rider/shared/widgets/inputs/input_time.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'controller_order.dart';

class PageOrder extends GetView<ControllerOrder> {
  const PageOrder({Key? key}) : super(key: key);

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
                      Row(
                        children: [
                          const SizedBox(
                            child: Icon(
                              Icons.perm_identity,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          horizontalSpace(17),
                          Obx(
                            () => DropdownButton(
                              hint: const Text('Ketersediaan Tempat'),
                              onChanged: (newValue) {
                                controller.dropDownValue.value =
                                    newValue.toString();
                                controller.update();
                              },
                              value: controller.dropDownValue.value,
                              items: [
                                for (var data in controller.dropDownList)
                                  DropdownMenuItem(
                                    child: Text(
                                      data,
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s14,
                                      ),
                                    ),
                                    value: data,
                                  )
                              ],
                            ),
                          ),
                          Text(
                            'orang',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(Insets.med),
                CardRounded(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                  child: InputIconUnderline(
                    onChange: (String) {},
                    icon: Icon(
                      Icons.money_rounded,
                      size: IconSizes.med,
                      color: AppColor.primaryColor,
                    ),
                    hintText: 'Harga Perjalanan',
                    inputFormatters: [ThousandsSeparatorInputFormatter(), LengthLimitingTextInputFormatter(7)],
                    keyboardType: TextInputType.number,
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
                          'Detail Perjalanan',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(Insets.sm),
                      CardRoundedBorder(
                        borderColor: AppColor.primaryColor,
                        width: Get.width,
                        height: Get.height * 0.22,
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Text(
                                'Berangkat',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            InputDate(
                              hintText: 'Pilih Tanggal Berangkat',
                              controller: controller.ctrlDateDept,
                              selectedDate: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.date_range,
                                color: AppColor.greyColor,
                                size: 20,
                              ),
                            ),
                            // verticalSpace(Insets.sm),
                            InputTime(
                              hintText: 'Pilih Waktu Berangkat',
                              controller: controller.ctrlTimeDept,
                              selectedTime: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.watch,
                                size: 20,
                                color: AppColor.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(Insets.med),
                      CardRoundedBorder(
                        borderColor: AppColor.primaryColor,
                        width: Get.width,
                        height: Get.height * 0.22,
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Text(
                                'Tiba',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            InputDate(
                              hintText: 'Pilih Tanggal Tiba',
                              controller: controller.ctrlDateArrv,
                              selectedDate: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.date_range,
                                color: AppColor.primaryColor,
                                size: 20,
                              ),
                            ),
                            // verticalSpace(Insets.sm),
                            InputTime(
                              hintText: 'Pilih Waktu Tiba',
                              controller: controller.ctrlTimeArrv,
                              selectedTime: (Value) {},
                              isValid: (Value) {},
                              prefixIcon: const Icon(
                                Icons.watch,
                                size: 20,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(Insets.med),
                ButtonPrimary(
                  onPressed: () {
                    Get.offNamed(Routes.main);
                  },
                  label: 'Bagikan',
                  color: AppColor.primaryColor,
                  size: 345,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
