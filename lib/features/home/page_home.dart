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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          controller.getData();
          await Future.delayed(const Duration(seconds: 3));
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CardRoundedBorder(
                  height: Get.height * 0.14.h,
                  color: AppColor.primaryColor,
                  borderRadius: 30,
                  margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                  child: Obx(
                    () => Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CustomIconButton(
                                    ontap: () {
                                      Get.toNamed(Routes.saldo);
                                    },
                                    icon: AppIcons.wallet,
                                    title: 'Saldo',
                                    iconColor: AppColor.whiteColor,
                                    iconHeight: 32.h,
                                    iconWidth: 32.w,
                                  ),
                                  horizontalSpace(7.w),
                                  CustomIconButton(
                                    ontap: () {
                                      Get.toNamed(Routes.actHistory);
                                    },
                                    icon: AppIcons.history,
                                    title: 'Riwayat',
                                    iconColor: AppColor.whiteColor,
                                    iconHeight: 25.h,
                                    iconWidth: 25.w,
                                    iconPadding:
                                        EdgeInsets.only(bottom: 3.h, top: 5.h),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: Get.width * 0.32.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'hai, ' +
                                              controller.controllerRiderInfo
                                                  .rider.value.name
                                                  .toString(),
                                          style: TextStyles.textTitle,
                                          maxLines: 2,
                                        ),
                                        verticalSpace(5),
                                        Text(
                                          controller.controllerRiderInfo.rider
                                                  .value.phone ??
                                              '',
                                          style: TextStyles.inter.copyWith(
                                            color: AppColor.whiteColor,
                                            fontSize: FontSizes.s14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  horizontalSpace(5),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.controllerRiderInfo.rider.value.status != 2
                      ? CardPrimary(
                          height: Get.height * 0.10.h,
                          width: Get.width * 0.85.w,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Insets.xs.w, vertical: Insets.xs.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.warning_amber_outlined,
                                  size: IconSizes.lg,
                                  color: AppColor.errorColor,
                                ),
                                horizontalSpace(Insets.med),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.controllerRiderInfo.rider
                                                    .value.status ==
                                                0
                                            ? "Lengkapi data diri & kendaraan anda untuk mulai menggunakan layanan kami"
                                            : "Admin sedang memverifikasi data anda, mohon tunggu 1x24 jam",
                                        style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s12,
                                          color: AppColor.neutral,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(Insets.xs),
                                controller.controllerRiderInfo.rider.value
                                            .status ==
                                        0
                                    ? OutlinedButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.userAccount);
                                        },
                                        child:
                                            const Icon(Icons.arrow_forward_ios),
                                        style: OutlinedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          primary: AppColor.primaryColor,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                verticalSpace(10.h),
                CardPrimary(
                  height: Get.height * 0.20.h,
                  width: Get.width * 0.85.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
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
                            height: 55.h,
                            width: 55.w,
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
                              Icons.streetview_outlined,
                              color: AppColor.primaryColor,
                            ),
                            hintText: 'tentukan perjalanan mu',
                            keyboardType: TextInputType.none,
                            onTap: () {
                              if (controller
                                      .controllerRiderInfo.rider.value.status ==
                                  2) {
                                Get.toNamed(Routes.posting);
                              } else {
                                var message = controller.controllerRiderInfo
                                            .rider.value.status ==
                                        0
                                    ? "Lengkapi data diri & kendaraan anda untuk mulai menggunakan layanan kami"
                                    : "Admin sedang memverifikasi data anda, mohon tunggu 1x24 jam";
                                Get.snackbar("Pemberitahuan", message);
                              }
                            },
                            padding: EdgeInsets.only(top: 10.h),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(10.h),
                CardPrimary(
                  height: Get.height * 0.17.h,
                  width: Get.width * 0.85.w,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
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
                            height: 40.h,
                            width: 40.w,
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
                            onPressed: () {
                              Get.toNamed(Routes.contact);
                            },
                            label: 'Hubungi kami',
                            textStyle: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primary.shade800,
                            ),
                          ),
                          Text(
                            'Butuh bantuan? Hubungi customer service kami dengan pelayanan terbaik',
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
          ),
        ),
      ),
    );
  }
}
