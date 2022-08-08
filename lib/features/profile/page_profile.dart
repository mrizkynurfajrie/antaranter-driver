import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
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

class PageProfile extends GetView<ControllerProfile> {
  const PageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      enableBack: false,
      toolbarColor: AppColor.whiteColor,
      toolbarElevation: 2,
      center: Center(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+62",
                                style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.neutral),
                              ),
                              Text(
                                controller.controllerRiderInfo.rider.value
                                        .phone ??
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
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.userAccount);
                },
                icon: AppIcons.iconApp(AppIcons.profUser,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Profil Pengguna',
              ),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.vehicleAccount);
                },
                icon: AppIcons.iconApp(AppIcons.profCar,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Profil Kendaraan',
              ),
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.contact);
                },
                icon: AppIcons.iconApp(AppIcons.profCallus,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Hubungi Kami',
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
              ButtonProfil(
                ontap: () {
                  Get.toNamed(Routes.termsProfile);
                },
                icon: AppIcons.iconApp(AppIcons.profTnc,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Syarat & Ketentuan',
              ),
              ButtonProfil(
                ontap: () async {
                  showPopUp(
                    imageUri: PopUpIcons.construction,
                    description: 'Under Construction',
                    dismissible: false,
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Get.back();
                },
                icon: AppIcons.iconApp(AppIcons.profPrivacy,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Kebijakan Privasi',
              ),
              ButtonProfil(
                ontap: () async {
                  showPopUp(
                    imageUri: PopUpIcons.construction,
                    description: 'Under Construction',
                    dismissible: false,
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  Get.back();
                },
                icon: AppIcons.iconApp(AppIcons.profRating,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Beri Penilaian Aplikasi',
              ),
              ButtonProfil(
                ontap: () {
                  controller.logout();
                },
                icon: AppIcons.iconApp(AppIcons.profLogout,
                    color: AppColor.primaryColor, height: IconSizes.sm),
                title: 'Keluar',
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
      child: CardRounded(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
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
