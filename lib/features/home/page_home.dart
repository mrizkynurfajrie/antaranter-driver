import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_icon.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/features/home/controller_home.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      enableBack: false,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogosMed.logoApp(AppLogosMed.logoOnly),
          horizontalSpace(5.w),
          Text(
            "AntarAnter",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: FontSizes.s14,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
            ),
          )
        ],
      ),
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          controller.getData();
          await Future.delayed(const Duration(seconds: 3));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CardRoundedBorder(
              borderColor: AppColor.greyColor,
              borderWidth: 2,
              color: AppColor.primaryColor,
              borderRadius: 30,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: Get.width * 0.32.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'hai,\n' +
                                          controller.controllerRiderInfo.rider
                                              .value.name
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
                  ? CardRounded(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.controllerRiderInfo.rider.value
                                                .status ==
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
                                      Get.toNamed(Routes.profile);
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
            CardRounded(
              width: Get.width * 0.85.w,
              padding: EdgeInsets.symmetric(vertical: 5.h),
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
                      // SvgPicture.asset(
                      //   AppIcons.carLocation,
                      //   height: 55.h,
                      //   width: 55.w,
                      // ),
                      horizontalSpace(5.w),
                      Icon(
                        CupertinoIcons.car_detailed,
                        color: AppColor.primaryColor,
                        size: 30.w,
                      ),
                      horizontalSpace(5.w),
                      Text(
                        '•',
                        style: TextStyles.textTableOrange,
                      ),
                    ],
                  ),
                  verticalSpace(15.h),
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
                        boxWidth: 300.w,
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
                            var message = controller.controllerRiderInfo.rider
                                        .value.status ==
                                    0
                                ? "Lengkapi data diri & kendaraan anda untuk mulai menggunakan layanan kami"
                                : "Admin sedang memverifikasi data anda, mohon tunggu 1x24 jam";
                            Get.snackbar("Pemberitahuan", message);
                          }
                        },
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            CardRounded(
              width: Get.width * 0.85.w,
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
                      horizontalSpace(5.w),
                      // SvgPicture.asset(
                      //   AppIcons.custService,
                      //   height: 40.h,
                      //   width: 40.w,
                      // ),
                      Icon(
                        CupertinoIcons.phone,
                        color: AppColor.primaryColor,
                        size: 30.w,
                      ),
                      horizontalSpace(5.w),
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
    );
  }
}
