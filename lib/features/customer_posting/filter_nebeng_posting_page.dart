import 'package:antaranter_driverapp/features/customer_posting/controller_customer_posting.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary_outline.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_date.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:intl/intl.dart';

import '../../../shared/widgets/buttons/button_primary.dart';

class FilterNebengPostingPage extends GetView<ControllerCustomerPosting> {
  const FilterNebengPostingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      backgroundColor: AppColor.whiteColor,
      title: "Filter perjalanan",
      toolbarTitleColor: AppColor.primaryColor,
      toolbarColor: Colors.white,
      center: null,
      toolbarElevation: 1,
      padding: EdgeInsets.zero,
      onBackPressed: () => Get.back(result: false),
      child: Obx(
        () => Padding(
          padding: EdgeInsets.all(Insets.sm),
          child: Column(
            children: [
              InputSelection(
                label: "Kota keberangkatan",
                valueText: controller.selectedCityDept.value,
                hintText: "Pilih kota keberangkatan",
                onTap: () {
                  controller.buildCitiesDep(context);
                },
                padding: EdgeInsets.all(Insets.sm),
                margin: EdgeInsets.only(bottom: Insets.xs, top: Insets.xs),
                width: Get.width,
                height: 50.h,
                isRequired: false,
              ),
              verticalSpace(Insets.med),
              InputSelection(
                label: "Kota tujuan",
                valueText: controller.selectedCityArv.value,
                hintText: "Pilih kota tujuan",
                onTap: () {
                  controller.buildCitiesArv(context);
                },
                padding: EdgeInsets.all(Insets.sm),
                margin: EdgeInsets.only(bottom: Insets.xs, top: Insets.xs),
                width: Get.width,
                height: 50.h,
                isRequired: false,
              ),
              verticalSpace(Insets.med),
              InputDate(
                margin: EdgeInsets.only(bottom: Insets.xs, top: Insets.xs),
                label: "Tanggal Keberangkatan",
                hintText: 'Pilih Tanggal Berangkat',
                controller: controller.txtDateDeptStart,
                boxHeight: 50.h,
                selectedDate: (value) {
                  controller.txtDateDeptEnd.text =
                      DateFormat('yyyy-MM-dd').format(value);
                  controller.initDateEnd.value = value;
                },
                validate: (value) {
                  return null;
                },
                isValid: (value) {},
                suffixIcon: const Icon(
                  Icons.date_range,
                  color: AppColor.greyColor,
                  size: 20,
                ),
                boxWidth: Get.width,
                initialDate: DateTime(
                  controller.now.year,
                  controller.now.month,
                  controller.now.day,
                ),
                firstDate: DateTime(
                  controller.now.year,
                  controller.now.month,
                  controller.now.day,
                ),
              ),
              verticalSpace(Insets.med),
              InputDate(
                margin: EdgeInsets.only(bottom: Insets.xs, top: Insets.xs),
                label: "Sampai dengan",
                hintText: 'Pilih Tanggal Berangkat',
                controller: controller.txtDateDeptEnd,
                boxHeight: 50.h,
                selectedDate: (value) {},
                validate: (value) {
                  return null;
                },
                isValid: (value) {},
                suffixIcon: const Icon(
                  Icons.date_range,
                  color: AppColor.greyColor,
                  size: 20,
                ),
                boxWidth: Get.width,
                initialDate: controller.initDateEnd.value,
                firstDate: controller.initDateEnd.value,
              ),
              verticalSpace(Insets.med),
              Row(
                children: [
                  Expanded(
                    child: ButtonPrimaryOutline(
                      onPressed: () {
                        // controller.searchData();
                        // Get.back(result: true);
                        controller.resetFilter();
                      },
                      label: "Atur Ulang",
                      labelStyle: TextStyles.textBaseBold.copyWith(
                        color: AppColor.primaryColor,
                      ),
                      borderRadius: Corners.xxl * 2,
                      height: IconSizes.xl - 4.h,
                    ),
                  ),
                  horizontalSpace(Insets.sm),
                  Expanded(
                    child: ButtonPrimary(
                      onPressed: () {
                        // controller.searchData();
                        Get.back(result: true);
                      },
                      label: "Pakai",
                      labelStyle: TextStyles.textBaseBold,
                      height: IconSizes.xl - 4.h,
                      cornerRadius: Corners.xxl * 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
