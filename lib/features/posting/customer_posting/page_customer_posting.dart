import 'dart:developer';
import 'package:antaranter_driverapp/features/posting/customer_posting/controller_customer_posting.dart';
import 'package:antaranter_driverapp/features/posting/customer_posting/filter_nebeng_posting_page.dart';
import 'package:antaranter_driverapp/features/posting/customer_posting/nebeng_posting_item.dart';
import 'package:antaranter_driverapp/features/posting/customer_posting/nebeng_posting_shimmer.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';

class PageCustomerPosting extends GetView<ControllerCustomerPosting> {
  const PageCustomerPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.loading.value,
        opacity: 0.5,
        color: AppColor.secondary,
        progressIndicator: loadingIndicator(context),
        child: RefreshIndicator(
          onRefresh: () async => controller.onRefresh(),
          child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: CardRounded(
                    width: Get.width,
                    color: AppColor.bgPageColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CardRounded(
                            color: AppColor.bgPageColor,
                            shadow: Shadows.none,
                            margin: EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dapatkan Penumpang',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    var isFilterData = await Get.to(
                                        () => const FilterNebengPostingPage());
                                    log("data back :$isFilterData");
                                    // controller.searchData();
                                    if (isFilterData != null &&
                                        isFilterData == true) {
                                      controller.searchData();
                                    }
                                    // controller.showTutorial();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_alt,
                                        size: IconSizes.sm,
                                        color: AppColor.primaryColor,
                                      ),
                                      horizontalSpace(Insets.xs),
                                      Text(
                                        "Filter",
                                        style: TextStyles.textSm.copyWith(
                                          color: AppColor.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        controller.loadingList.isFalse
                            ? controller.listCustomerNebeng.isNotEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          vertical: Insets.sm,
                                          horizontal: Insets.sm),
                                      itemCount:
                                          controller.listCustomerNebeng.length,
                                      itemBuilder: (context, index) =>
                                          NebengPostingItem(
                                              nebengPost: controller
                                                  .listCustomerNebeng[index]),
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Lottie.asset(AppLotties.emptyList,
                                          height: 230.w),
                                      Text(
                                        "Belum ada nebeng yang tersedia",
                                        style: TextStyles.textSm,
                                      ),
                                      verticalSpace(Insets.lg),
                                    ],
                                  )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical: Insets.sm, horizontal: Insets.sm),
                                itemCount: 2,
                                itemBuilder: (context, index) =>
                                    const NebengPostingShimmer(),
                              ),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

class CardInfoProkes extends StatefulWidget {
  const CardInfoProkes({Key? key}) : super(key: key);

  @override
  State<CardInfoProkes> createState() => _CardInfoProkesState();
}

class _CardInfoProkesState extends State<CardInfoProkes> {
  double _height = 55.h;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.webView, arguments: {
          'title': "Panduan protokol kesehatan",
          'url': "https://antaranter.com/panduan-protokol-kesehatan",
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: Insets.sm),
        // Use the properties stored in the State class.
        width: Get.width,
        height: _height,
        color: AppColor.primaryColor,
        // Define how long the animation should take.
        duration: const Duration(milliseconds: 500),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.easeOut,
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: AppColor.whiteColor,
              size: IconSizes.med,
            ),
            horizontalSpace(Insets.sm),
            Expanded(
              child: Text(
                "Informasi panduan protokol kesehatan",
                style: TextStyles.inter.copyWith(
                  color: AppColor.whiteColor,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _height = 0;
                });
              },
              icon: Icon(
                Icons.close,
                size: Sizes.sm,
                color: AppColor.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
