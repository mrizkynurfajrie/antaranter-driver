import 'package:antaranter_driverapp/response/nebeng_customer_response.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded_clickable.dart';
import 'package:shimmer/shimmer.dart';

class NebengPostingItem extends StatelessWidget {
  const NebengPostingItem({Key? key, required this.nebengPost})
      : super(key: key);

  final NebengCustomerResponse nebengPost;

  @override
  Widget build(BuildContext context) {
    return CardRoundedClickable(
      margin: EdgeInsets.only(
        bottom: Insets.med,
      ),
      shadow: Shadows.shadowsUp,
      onTap: () {
        Get.toNamed(
          Routes.postingCustomerOrder,
          arguments: nebengPost.toJson(),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: SizedBox(
                  height: IconSizes.lg,
                  width: IconSizes.lg,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrlPath(nebengPost.user?.image ?? ''),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer(
                      gradient: AppColor.shimmerGradient,
                      child: Container(
                        color: AppColor.whiteColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xffffffff)),
                      child: Icon(
                        CupertinoIcons.person_fill,
                        size: 35,
                        color: AppColor.bodyColor.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(Insets.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${nebengPost.user?.username}",
                    style: TextStyles.textSm,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(Insets.xs - 2.w),
                  Row(
                    children: [
                      nebengPost.user?.gender == 'male'
                          ? SvgPicture.asset(
                              AppIcons.genderMale,
                              width: Sizes.xs,
                            )
                          : SvgPicture.asset(
                              AppIcons.genderFemale,
                              width: Sizes.xs,
                            ),
                      horizontalSpace(Insets.sm),
                      Text(
                        "${nebengPost.user?.city}",
                        style: TextStyles.text2xs.copyWith(
                          color: AppColor.neutral.shade600,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          verticalSpace(Insets.med),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Titik awal",
                      style: TextStyles.text2xs.copyWith(
                        color: AppColor.subTextColor,
                      ),
                    ),
                    verticalSpace(Insets.xs - Insets.offsetScale),
                    Text(
                      "${nebengPost.cityOrigin}",
                      style: TextStyles.textXs,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tujuan",
                      style: TextStyles.text2xs.copyWith(
                        color: AppColor.subTextColor,
                      ),
                    ),
                    verticalSpace(Insets.xs - Insets.offsetScale),
                    Text(
                      "${nebengPost.cityDestination}",
                      style: TextStyles.textXs,
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(Insets.sm),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Waktu Berangkat",
                      style: TextStyles.text2xs.copyWith(
                        color: AppColor.subTextColor,
                      ),
                    ),
                    verticalSpace(Insets.xs - Insets.offsetScale),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: Sizes.sm,
                            ),
                            horizontalSpace(Insets.xs),
                            Text(
                              FormatDateTime.formatDateLocale(
                                nebengPost.dateDep.toString(),
                              ),
                              style: TextStyles.textXs,
                            ),
                          ],
                        ),
                        // horizontalSpace(Insets.xs),
                        // Flexible(
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.watch_later_outlined,
                        //         size: Sizes.sm,
                        //       ),
                        //       horizontalSpace(Insets.xs),
                        //       Text(
                        //         "${nebengPost.timeDep?.split(':')[0]}:${nebengPost.timeDep?.split(':')[1]}",
                        //         style: TextStyles.textXs,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumlah Penumpang",
                      style: TextStyles.text2xs.copyWith(
                        color: AppColor.subTextColor,
                      ),
                    ),
                    verticalSpace(Insets.xs - Insets.offsetScale),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
