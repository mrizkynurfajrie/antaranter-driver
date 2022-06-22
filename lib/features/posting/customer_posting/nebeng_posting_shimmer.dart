import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:shimmer/shimmer.dart';

class NebengPostingShimmer extends StatelessWidget {
  const NebengPostingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardRounded(
      margin: EdgeInsets.only(
        bottom: Insets.med,
      ),
      shadow: Shadows.shadowsUp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            height: Sizes.med,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: AppColor.whiteColor,
              ),
            ),
          ),
          verticalSpace(Insets.sm),
          SizedBox(
            width: 100.w,
            height: Sizes.med,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: AppColor.whiteColor,
              ),
            ),
          ),
          verticalSpace(Insets.sm),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Sizes.med,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
              horizontalSpace(Insets.med),
              Expanded(
                child: SizedBox(
                  height: Sizes.med,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(Insets.sm),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: Sizes.med,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
              horizontalSpace(Insets.med),
              Expanded(
                child: SizedBox(
                  height: Sizes.med,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(Insets.xs),
          const Divider(
            color: Color(0xFFC2C2C2),
          ),
          verticalSpace(Insets.xs),
          SizedBox(
            width: Get.width * 0.4,
            height: Sizes.med,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
