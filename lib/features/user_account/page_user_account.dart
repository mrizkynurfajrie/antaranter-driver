import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/user_account/controller_user_account.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/inputs/input_email.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/constants/styles.dart';

class PageUserAccount extends GetView<ControllerUserAccount> {
  const PageUserAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'Perbarui Akun Pengguna',
      toolbarColor: AppColor.primaryColor,
      padding: EdgeInsets.zero,
      enableBack: true,
      backgroundColor: AppColor.bgPageColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: SizedBox(
                        height: IconSizes.xxxl,
                        width: IconSizes.xxxl,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: 'https://via.placeholder.com/150',
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
                    horizontalSpace(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'mrizkynurfajrie',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpace(2.h),
                        Text(
                          '0852xxxxxx',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            color: AppColor.neutral,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        verticalSpace(2.h),
                        Text(
                          'driver@mail.com',
                          style: TextStyles.inter.copyWith(
                            fontSize: FontSizes.s14,
                            color: AppColor.neutral,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(10.h),
                InputEmail(
                  controller: controller.txtEmail,
                  isValid: (value) {},
                  email: (value) {},
                  hintText: 'E-mail',
                  prefixIcon: const Icon(Icons.mail),
                  boxWidth: 345.w,
                ),
                InputPrimary(
                  hintText: 'Nama',
                  onTap: () {},
                  prefixIcon: const Icon(Icons.person),
                  maxLines: 1,
                  boxWidth: 345.w,
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
