import 'package:antaranter_driverapp/framework/api1.dart';
import 'package:antaranter_driverapp/shared/helpers/currency_formatter.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/features/home/controller_home.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

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
      child: Obx(() => controller.loading.isFalse
          ? RefreshIndicator(
              color: AppColor.primaryColor,
              onRefresh: () async {
                controller.getData();
                await Future.delayed(const Duration(seconds: 3));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CardRoundedBorder(
                      width: Get.width,
                      borderColor: AppColor.greyColor,
                      borderWidth: 2,
                      color: AppColor.primaryColor,
                      borderRadius: 18,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      margin:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Hai Mitra Driver',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s14,
                                        color: AppColor.whiteColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .controllerRiderInfo.rider.value.name
                                          .toString(),
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s16,
                                        color: AppColor.whiteColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                    ),
                                    verticalSpace(5),
                                    Row(
                                      children: [
                                        Text(
                                          '+62',
                                          style: TextStyles.inter.copyWith(
                                            color: AppColor.whiteColor,
                                            fontSize: FontSizes.s14,
                                          ),
                                        ),
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
                                  ],
                                ),
                                ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: SizedBox(
                          height: IconSizes.xxl,
                          width: IconSizes.xxl,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "${Api1().imgStorUrl}${controller.controllerRiderInfo.rider.value.image}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Shimmer(
                              gradient: AppColor.shimmerGradient,
                              child: Container(
                                color: AppColor.whiteColor,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(
                              'assets/images/avatar_dummy.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.saldo);
                    },
                    child: CardRounded(
                      margin: EdgeInsets.symmetric(
                        horizontal: Insets.med,
                        vertical: Insets.sm,
                      ),
                      color: AppColor.whiteColor,
                      borderRadius: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  'Saldo',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  CurrencyFormat.convertToIdr(
                                      controller.balance.value.currBalance, 0),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Visibility(
                                visible: controller.balancedWarning.value,
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, top: 10),
                                  child: const Text(
                                    '*Yuk, isi saldo kamu sekarang',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.red),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColor.primaryColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.controllerRiderInfo.rider.value.status !=
                              2
                          ? CardRoundedBorder(
                              borderRadius: 9,
                              borderWidth: 2,
                              borderColor: controller.controllerRiderInfo.rider
                                              .value.status ==
                                          0 &&
                                      controller.controllerVehicleInfo.vehicle
                                              .value.sim ==
                                          null
                                  ? AppColor.errorColor
                                  : AppColor.transparentColor,
                              color: controller.controllerRiderInfo.rider.value
                                              .status ==
                                          0 &&
                                      controller.controllerVehicleInfo.vehicle
                                              .value.sim ==
                                          null
                                  ? AppColor.whiteColor
                                  : AppColor.primary.shade200.withOpacity(0.7),
                              margin: EdgeInsets.symmetric(
                                  horizontal: Insets.med.w,
                                  vertical: Insets.med.h),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Insets.xs.w,
                                    vertical: Insets.xs.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                        controller.controllerRiderInfo.rider
                                                        .value.status ==
                                                    0 &&
                                                controller.controllerVehicleInfo
                                                        .vehicle.value.sim ==
                                                    null
                                            ? Icons.warning_amber_rounded
                                            : Icons.info_outline_rounded,
                                        size: IconSizes.lg,
                                        color: controller.controllerRiderInfo
                                                        .rider.value.status ==
                                                    0 &&
                                                controller.controllerVehicleInfo
                                                        .vehicle.value.sim ==
                                                    null
                                            ? AppColor.errorColor
                                            : AppColor.primary),
                                    horizontalSpace(Insets.med),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller.controllerRiderInfo.rider
                                                            .value.status ==
                                                        0 &&
                                                    controller
                                                            .controllerVehicleInfo
                                                            .vehicle
                                                            .value
                                                            .sim ==
                                                        null
                                                ? controller
                                                                .controllerRiderInfo
                                                                .rider
                                                                .value
                                                                .status ==
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
                                            controller.controllerVehicleInfo
                                                    .vehicle.value.sim ==
                                                null
                                        ? OutlinedButton(
                                            onPressed: () {
                                              Get.offAllNamed(Routes.main,
                                                  arguments: 2);
                                            },
                                            child: const Icon(
                                                Icons.arrow_forward_ios),
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
                                  if (controller.controllerRiderInfo.rider.value
                                          .status ==
                                      2) {
                                    Get.toNamed(Routes.postingPage);
                                    // if (controller.controllerRiderInfo.hasActivePost
                                    //         .value ==
                                    //     true) {
                                    //   showPopUp(
                                    //       title: 'Perjalanan Nebeng',
                                    //       description:
                                    //           'Anda masih memiliki pesanan aktif',
                                    //       imageUri: PopUpIcons.error);
                                    //   await Future.delayed(
                                    //       const Duration(seconds: 2));
                                    //   Get.back();
                                    // } else {
                                    //   Get.toNamed(Routes.postingPage);
                                    // }
                                  } else {
                                    var message = controller.controllerRiderInfo
                                                    .rider.value.status ==
                                                0 &&
                                            controller.controllerVehicleInfo
                                                    .vehicle.value.sim ==
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

                                  //code lama//
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
            )
          : loadingIndicator(context)),
    );
  }
}
