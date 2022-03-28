import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/profile/controller_profile.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:shimmer/shimmer.dart';
import '../../framework/api1.dart';
import '../../shared/constants/styles.dart';
import '../../shared/widgets/cards/card_rounded_border.dart';

class PageProfile extends GetView<ControllerProfile> {
  const PageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'INTAKE',
      enableBack: false,
      toolbarColor: AppColor.primaryColor,
      center: AppLogos.logoApp(AppLogos.logoUncoloured),
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              height: Get.height * 0.17.h,
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
                              "${Api1().baseUrl}images/${controller.image.value}",
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Shimmer(
                            gradient: AppColor.shimmerGradient,
                            child: Container(
                              color: AppColor.whiteColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/avatar_dummy.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(5.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          controller.name.value,
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        verticalSpace(5.h),
                        Text(
                          controller.phone.value,
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
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {
                Get.toNamed(Routes.userAccount);
              },
              icon: AppIcons.profUser,
              title: 'Profil Pengguna',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {
                Get.toNamed(Routes.vehicleAccount);
              },
              icon: AppIcons.profCar,
              title: 'Profil Kendaraan',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {
                Get.toNamed(Routes.contact);
              },
              icon: AppIcons.profCallus,
              title: 'Hubungi Kami',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
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
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {},
              icon: AppIcons.profTnc,
              title: 'Syarat & Ketentuan',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {},
              icon: AppIcons.profPrivacy,
              title: 'Kebijakan Privasi',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {},
              icon: AppIcons.profRating,
              title: 'Beri Penilaian Aplikasi',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(5.h),
            ButtonProfil(
              ontap: () {
                controller.logout();
              },
              icon: AppIcons.profLogout,
              title: 'Keluar',
              buttonHeight: Get.height * 0.07,
              buttonWidth: Get.width * 0.9,
            ),
            verticalSpace(25.h),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                'ver. 0.1',
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonProfil extends StatelessWidget {
  final Function() ontap;
  final String icon;
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
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
              ),
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
