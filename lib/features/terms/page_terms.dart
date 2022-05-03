import 'package:antaranter_driverapp/features/terms/controller_terms.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageTermsProfile extends GetView<ControllerTermsProfile> {
  const PageTermsProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      toolbarElevation: 0,
      toolbarColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgPageColor,
      padding: EdgeInsets.zero,
      center: Center(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
      ),
      child: SafeArea(
        child: CardRounded(
          width: Get.width,
          color: AppColor.bgPageColor,
          shadow: Shadows.none,
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Text(
                'Syarat & Ketentuan',
                style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.neutral,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Aplikasi',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.neutral,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' AntarAnter',
                    style: TextStyles.inter.copyWith(
                      fontSize: FontSizes.s16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              verticalSpace(15.h),
              CardRoundedBorder(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: Get.height * 0.60.h,
                borderColor: AppColor.greyColorLight,
                child: Obx(
                  () => controller.loading.isFalse 
                ?  Scrollbar(
                    child: ListView(
                      children: [
                        Html(
                          data: controller.terms.value.skDesc!,
                        ),
                      ],
                    ),
                  ) : loadingIndicatorBottom(context),
                ),
              ),
              verticalSpace(10.h),
              CardRounded(
                color: AppColor.bgPageColor,
                shadow: Shadows.none,
                child: ButtonPrimary(
                  onPressed: () {
                    Get.offAllNamed(Routes.main, arguments: 2);
                  },
                  label: 'Kembali',
                  cornerRadius: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
