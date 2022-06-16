import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antaranter_driverapp/features/register/controller_register.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_border.dart';
import 'package:antaranter_driverapp/shared/widgets/others/checkbox_label.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageTerms extends GetView<ControllerRegister> {
  const PageTerms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      enableBack: false,
      padding: EdgeInsets.symmetric(horizontal: Insets.xl),
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      center: Center(
        child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Selamat datang",
                  style: TextStyles.textH2,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(5.h),
                CardRounded(
                  shadow: Shadows.none,
                  color: AppColor.bgPageColor,
                  margin: EdgeInsets.zero,
                  child: Text(
                    "Mohon perhatikan dan pahami ketentuan berikut untuk dapat menjadi mitra AntarAnter Driver",
                    style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                verticalSpace(5.h),
                // CardRoundedBorder(
                //   padding: EdgeInsets.only(left: 3.w, right: 5.w),
                //   borderColor: AppColor.greyColorLight,
                //   height: Get.height * 0.55.h,
                //   child: Obx(
                //     () => controller.loading.isFalse
                //         ? Scrollbar(
                //             child: ListView(
                //               children: [
                //                 Html(
                //                   data: controller.termCondition.value.skDesc,
                //                 )
                //               ],
                //             ),
                //           )
                //         : loadingIndicatorBottom(context),
                //   ),
                // ),
                Expanded(
                  flex: 10,
                  child: CardRounded(
                    width: Get.width,
                    color: AppColor.whiteColor,
                    child: Obx(
                      () => controller.loading.isFalse
                          ? Scrollbar(
                              child: ListView(
                                children: [
                                  Html(
                                    data: controller.termCondition.value.skDesc,
                                  )
                                ],
                              ),
                            )
                          : loadingIndicatorBottom(context),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: CheckboxLabel(
                    onChange: (value) {
                      controller.statusAgreementTerm.value = value;
                    },
                    label:
                        'Saya mengerti dan memahami dengan syarat serta ketentuan yang berlaku',
                    colorBorder: AppColor.greyColorLight,
                    labelStyle: TextStyles.textcheckbox,
                    width: Get.width * 0.75.w,
                  ),
                ),
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: ButtonPrimary(
                      enable: controller.statusAgreementTerm.value,
                      label: 'Konfirmasi',
                      color: AppColor.primaryColor,
                      cornerRadius: 9,
                      onPressed: () {
                        Get.toNamed('/register_page');
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
