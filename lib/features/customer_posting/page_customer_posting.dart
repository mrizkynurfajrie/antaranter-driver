import 'package:antaranter_driverapp/features/customer_posting/controller_customer_posting.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PageCustomerPosting extends GetView<ControllerCustomerPosting> {
  const PageCustomerPosting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: true,
      toolbarTitleColor: AppColor.whiteColor,
      center: Center(
        child: Text(
          'Calon Penumpang',
          style: TextStyles.inter.copyWith(
            fontSize: FontSizes.s18,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
                    // var isFilterData =
                    //     await Get.to(() => const FilterNebengPostingPage());
                    // log("data back :" + isFilterData.toString());
                    // // controller.searchData();
                    // if (isFilterData != null && isFilterData == true) {
                    //   controller.searchData();
                    // }
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
                ),
              ],
            ),
            verticalSpace(15.h),
            CardRounded(
              width: Get.width,
              borderRadius: 8,
              margin: EdgeInsets.symmetric(horizontal: 0.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // log("gambar image : " +
                          //     nebengOrder.users!.image.toString());
                          // if (nebengOrder.users!.image != null) {
                          //   showPopUpImage(
                          //     imageUri: imageUrlPath(
                          //       '${nebengOrder.users?.image}',
                          //     ),
                          //   );
                          // } else {
                          //   showPopUpImage(
                          //       imageUri:
                          //           'https://antaranter.sgp1.digitaloceanspaces.com/PROD/avatar_dummy.png');
                          // }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: SizedBox(
                            height: IconSizes.xl,
                            width: IconSizes.xl,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: imageUrlPath(
                                  // '${nebengOrder.users?.image}',
                                  ''),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Shimmer(
                                child: Container(color: AppColor.whiteColor),
                                gradient: AppColor.shimmerGradient,
                              ),
                              errorWidget: (context, url, error) =>
                                  DottedBorder(
                                dashPattern: const [12, 4],
                                strokeWidth: 1,
                                strokeCap: StrokeCap.round,
                                color: AppColor.greyColorLight,
                                borderType: BorderType.Circle,
                                radius: const Radius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SvgPicture.asset(
                                    AppIcons.dummyAvatar,
                                    color: AppColor.neutral,
                                    // '${nebengOrder.users?.gender}' == 'male'
                                    //     ? AppColor.genderMale
                                    //     : AppColor.genderFemale,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(5.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Penumpang',
                            style: TextStyles.inter.copyWith(
                              fontSize: FontSizes.s14,
                              color: AppColor.neutral,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpace(5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.male,
                                size: Sizes.smmed,
                                color: AppColor.genderMale,
                              ),
                              horizontalSpace(5.w),
                              Text(
                                'Kota Penumpang',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  Container(
                    width: Get.width,
                    height: 1,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.cardline,
                        ),
                        boxShadow: Shadows.shadowsUp),
                  ),
                  verticalSpace(10.h),
                  Row(
                    children: [
                      Container(
                        width: Get.width * 0.39.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Titik Awal',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.greyColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpace(3.h),
                            Text(
                              'Kota / Kabupaten',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.neutral,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            verticalSpace(10.h),
                            Text(
                              'Waktu Berangkat',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.greyColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpace(3.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  size: Sizes.smmed,
                                ),
                                horizontalSpace(5.w),
                                Text(
                                  '25 Mei 2022',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * 0.39.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tujuan',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.greyColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpace(3.h),
                            Text(
                              'Kota / Kabupaten',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.neutral,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            verticalSpace(10.h),
                            Text(
                              'Jumlah Penumpang',
                              style: TextStyles.inter.copyWith(
                                fontSize: FontSizes.s12,
                                color: AppColor.greyColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpace(3.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.event_seat_outlined,
                                  size: Sizes.smmed,
                                ),
                                horizontalSpace(5.w),
                                Text(
                                  '2',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                horizontalSpace(5.w),
                                Text(
                                  'Penumpang',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    color: AppColor.neutral,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
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
    );
  }
}
