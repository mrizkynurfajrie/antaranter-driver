import 'package:antaranter_driverapp/features/posting/controller_posting.dart';
import 'package:antaranter_driverapp/features/posting/customer_posting/page_customer_posting.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/page_nebeng_posting.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_top.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PagePosting extends StatelessWidget {
  const PagePosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      toolbarColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgPageColor,
      toolbarElevation: 2,
      enableBack: true,
      onBackPressed: () {
        Get.offNamed(Routes.main, arguments: 0);
      },
      toolbarTitleColor: AppColor.primaryColor,
      center: Center(child: AppLogosMed.logoApp(AppLogosMed.logoHorizontal)),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: Insets.lg),
                indicatorWeight: 4,
                labelColor: AppColor.primaryColor,
                labelStyle: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: const Color(0xFF9E9E9E),
                unselectedLabelStyle: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(
                    text: 'Buat Perjalanan',
                  ),
                  Tab(
                    text: 'Pelanggan Nebeng',
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardRoundedTop(
                padding: EdgeInsets.zero,
                borderRadius: Corners.lg,
                margin: EdgeInsets.zero,
                child: const TabBarView(
                  children: <Widget>[
                    PageNebengPosting(),
                    PageCustomerPosting(),
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
