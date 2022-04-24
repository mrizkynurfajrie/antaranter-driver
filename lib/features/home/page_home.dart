import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
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
      toolbarElevation: 2,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
        ],
      ),
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          controller.getData();
          await Future.delayed(const Duration(seconds: 3));
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CardRoundedBorder(
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
            SliverToBoxAdapter(
              child: Obx(
                () => controller.controllerRiderInfo.rider.value.status != 2
                    ? CardRoundedBorder(
                        borderRadius: 9,
                        borderWidth: 2,
                        borderColor:
                            controller.controllerRiderInfo.rider.value.status ==
                                        0 &&
                                    controller.controllerVehicleInfo.vehicle
                                            .value.sim ==
                                        null
                                ? AppColor.errorColor
                                : AppColor.transparentColor,
                        color:
                            controller.controllerRiderInfo.rider.value.status ==
                                        0 &&
                                    controller.controllerVehicleInfo.vehicle
                                            .value.sim ==
                                        null
                                ? AppColor.whiteColor
                                : AppColor.primary.shade200.withOpacity(0.7),
                        margin: EdgeInsets.symmetric(
                            horizontal: Insets.med.w, vertical: Insets.med.h),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Insets.xs.w, vertical: Insets.xs.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                  controller.controllerRiderInfo.rider.value
                                                  .status ==
                                              0 &&
                                          controller.controllerVehicleInfo
                                                  .vehicle.value.sim ==
                                              null
                                      ? Icons.warning_amber_rounded
                                      : Icons.info_outline_rounded,
                                  size: IconSizes.lg,
                                  color: controller.controllerRiderInfo.rider
                                                  .value.status ==
                                              0 &&
                                          controller.controllerVehicleInfo
                                                  .vehicle.value.sim ==
                                              null
                                      ? AppColor.errorColor
                                      : AppColor.primary),
                              horizontalSpace(Insets.med),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.controllerRiderInfo.rider.value
                                                      .status ==
                                                  0 &&
                                              controller.controllerVehicleInfo
                                                      .vehicle.value.sim ==
                                                  null
                                          ? controller.controllerRiderInfo.rider
                                                          .value.status ==
                                                      1 &&
                                                  controller
                                                          .controllerVehicleInfo
                                                          .vehicle
                                                          .value
                                                          .sim ==
                                                      null
                                              ? "Anda belum melengkapi data kendaraan anda, silakan lengkapi terlebih dahulu"
                                              : "Lengkapi data diri & kendaraan anda untuk mulai menggunakan layanan kami"
                                          : "Admin sedang melakukan verifikasi data anda. Mohon tunggu 1x24 jam admin akan segera menghubungi anda.",
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.neutral,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              horizontalSpace(Insets.xs),
                              controller.controllerRiderInfo.rider.value
                                              .status ==
                                          0 &&
                                      controller.controllerVehicleInfo.vehicle
                                              .value.sim ==
                                          null
                                  ? OutlinedButton(
                                      onPressed: () {
                                        Get.offAllNamed(Routes.main,
                                            arguments: 2);
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
            ),
            SliverToBoxAdapter(
              child: CardRounded(
                margin: EdgeInsets.only(
                    right: Insets.med.w,
                    left: Insets.med.w,
                    bottom: Insets.med.h),
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
                          onTap: () async {
                            if (controller
                                    .controllerRiderInfo.rider.value.status ==
                                2) {
                              if (controller.controllerRiderInfo.hasActivePost == true) {
                                showPopUp(
                                    title: 'Perjalanan Nebeng',
                                    description:
                                        'Anda masih memiliki pesanan aktif',
                                    imageUri: PopUpIcons.error);
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                Get.back();
                              } else {
                                Get.toNamed(Routes.posting);
                              }

                              // if (controller.controllerPosting.postingan.value
                              //             .nebengPosting!.status ==
                              //         3 &&
                              //     controller.controllerPosting.postingan.value
                              //             .nebengPosting!.status ==
                              //         4) {
                              //   Get.toNamed(Routes.posting);
                              // } else {
                              //   Get.snackbar("Gagal",
                              //       "Anda sedang ada pesanan aktif, hanya bisa membagikan perjalanan sebanyak 1x");
                              // }
                            } else {
                              var message = controller.controllerRiderInfo.rider
                                              .value.status ==
                                          0 &&
                                      controller.controllerVehicleInfo.vehicle
                                              .value.sim ==
                                          null
                                  ? "Lengkapi data diri & kendaraan anda untuk mulai menggunakan layanan kami"
                                  : "Admin sedang melakukan verifikasi data anda, mohon tunggu 1x24 jam admin akan segera menghubungi anda";
                              showPopUp(
                                title: 'Pemberitahuan',
                                description: message,
                                imageUri: PopUpIcons.information,
                                dismissible: false,
                                labelButton: 'OK',
                                labelButtonColor: AppColor.primary,
                                outlineButtonColor: AppColor.primary,
                              );
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
            ),
            SliverToBoxAdapter(
              child: CardRounded(
                margin: EdgeInsets.symmetric(horizontal: Insets.med.w),
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
            ),
          ],
        ),
      ),
    );
  }
}
