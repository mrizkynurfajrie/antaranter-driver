import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/profile/controller_profile.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:shimmer/shimmer.dart';
import '../../framework/api1.dart';
import '../../shared/constants/styles.dart';
import '../../shared/widgets/cards/card_rounded_border.dart';

class PageProfile extends GetView<ControllerProfile> {
  const PageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      enableBack: false,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      center: Align(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
        alignment: Alignment.centerRight,
      ),
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      child: RefreshIndicator(
        color: AppColor.primaryColor,
        onRefresh: () async {
          controller.onInit();
          await Future.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                width: Get.width.w,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                      verticalSpace(8.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.controllerRiderInfo.rider.value.name ??
                                "-",
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          verticalSpace(8.h),
                          Text(
                            controller.controllerRiderInfo.rider.value.phone ??
                                "-",
                            style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.neutral),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    'Informasi Akun',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.userAccount);
                },
                icon: AppIcons.iconApp(AppIcons.profUser),
                title: 'Profil Pengguna',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.vehicleAccount);
                },
                icon: AppIcons.iconApp(AppIcons.profCar),
                title: 'Profil Kendaraan',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.contact);
                },
                icon: AppIcons.iconApp(AppIcons.profCallus),
                title: 'Hubungi Kami',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    'Lainnya',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.termsProfile);
                },
                icon: AppIcons.iconApp(AppIcons.profTnc),
                title: 'Syarat & Ketentuan',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {},
                icon: AppIcons.iconApp(AppIcons.profPrivacy),
                title: 'Kebijakan Privasi',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {},
                icon: AppIcons.iconApp(AppIcons.profRating),
                title: 'Beri Penilaian Aplikasi',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(8.h),
              ButtonProfil(
                ontap: () {
                  controller.logout();
                },
                icon: AppIcons.iconApp(AppIcons.profLogout),
                title: 'Keluar',
                buttonHeight: Get.height * 0.08.h,
                buttonWidth: Get.width * 0.9.w,
              ),
              verticalSpace(15.h)
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonProfil extends StatelessWidget {
  final Function() ontap;
  final Widget? icon;
  final String title;
  final double? buttonHeight;
  final double? buttonWidth;

  const ButtonProfil({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CardRoundedBorder(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
        height: buttonHeight,
        width: buttonWidth,
        shadow: Shadows.universal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 25.w,
              height: 25.h,
              color: AppColor.whiteColor,
              child: icon,
            ),
            horizontalSpace(7.h),
            Text(
              title,
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
