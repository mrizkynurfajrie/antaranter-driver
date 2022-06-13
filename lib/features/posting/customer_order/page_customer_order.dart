import 'package:antaranter_driverapp/features/posting/customer_order/controller_customer_order.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/shared/widgets/appbar/appbar.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PageCustomerOrder extends GetView<ControllerCustomerOrder> {
  const PageCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: const CustomAppBar(
        color: AppColor.primaryColor,
        title: '',
        colorTitle: AppColor.whiteColor,
        useLeading: true,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(Insets.xl),
            CardRounded(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.lg,
                vertical: Insets.med,
              ),
              margin: EdgeInsets.zero,
              borderRadius: 0,
              shadow: const [],
              child: Column(
                children: [
                  const TitleSection(
                    icon: AppIcons.riderPerson,
                    title: 'Penumpang',
                  ),
                  verticalSpace(Insets.sm),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (controller
                                  .postinganCustomerNebeng.value.user?.image !=
                              null) {
                            showPopUpImage(
                              imageUri: imageUrlPath(controller
                                      .postinganCustomerNebeng
                                      .value
                                      .user
                                      ?.image ??
                                  ''),
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: SizedBox(
                            height: IconSizes.xl,
                            width: IconSizes.xl,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: imageUrlPath(controller
                                      .postinganCustomerNebeng
                                      .value
                                      .user
                                      ?.image ??
                                  ''),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Shimmer(
                                gradient: AppColor.shimmerGradient,
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    color: Color(0xffffffff)),
                                child: Icon(
                                  CupertinoIcons.person_fill,
                                  size: 55,
                                  color: AppColor.bodyColor.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(Insets.lg),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.postinganCustomerNebeng.value.user?.username}",
                              style: TextStyles.textSm.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            verticalSpace(Insets.xs),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  controller.postinganCustomerNebeng.value.user
                                              ?.gender ==
                                          'male'
                                      ? AppIcons.genderMale
                                      : AppIcons.genderFemale,
                                  width: Sizes.sm,
                                  height: Sizes.sm,
                                ),
                                horizontalSpace(Insets.xs),
                                Text(
                                  "${controller.postinganCustomerNebeng.value.user?.city}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.textXs.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF757575),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            verticalSpace(Insets.xl),
            CardRounded(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.lg,
                vertical: Insets.med,
              ),
              margin: EdgeInsets.zero,
              borderRadius: 0,
              shadow: const [],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSection(
                    icon: AppIcons.map,
                    title: 'Rute dan Jadwal',
                  ),
                  verticalSpace(Insets.sm),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Titik awal",
                          style: TextStyles.text2xs.copyWith(
                            color: AppColor.subTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${controller.postinganCustomerNebeng.value.cityOrigin}",
                          style: TextStyles.textXs.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF404040),
                          ),
                        ),
                        verticalSpace(Insets.xs),
                        Text(
                          "Tujuan",
                          style: TextStyles.text2xs.copyWith(
                            color: AppColor.subTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${controller.postinganCustomerNebeng.value.cityDestination}",
                          style: TextStyles.textXs.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF404040),
                          ),
                        ),
                        verticalSpace(Insets.xs),
                        Text(
                          "Waktu Perjalanan",
                          style: TextStyles.text2xs.copyWith(
                            color: AppColor.subTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                                    controller
                                        .postinganCustomerNebeng.value.dateDep
                                        .toString(),
                                  ),
                                  style: TextStyles.textXs.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF404040),
                                  ),
                                ),
                              ],
                            ),
                            horizontalSpace(Insets.lg),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(Insets.xl),
            CardRounded(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.lg,
                vertical: Insets.med,
              ),
              margin: EdgeInsets.zero,
              borderRadius: 0,
              shadow: const [],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSection(
                    icon: AppIcons.note,
                    title: 'Preferensi Jenis Kelamin Pengemudi',
                  ),
                  verticalSpace(Insets.sm),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.postinganCustomerNebeng.value.user
                                      ?.gender ==
                                  'male'
                              ? "Laki-Laki"
                              : "Perempuan",
                          style: TextStyles.text2xs.copyWith(
                            color: const Color(0xFF404040),
                            fontWeight: FontWeight.w500,
                            fontSize: FontSizes.s14,
                          ),
                        ),
                        verticalSpace(Insets.xs),
                        Text(
                          "*Preferensi gender pengemudi yang diinginkan penumpang untuk meningkatkan keamanan dan kenyamanan.",
                          style: TextStyles.text2xs.copyWith(
                            color: AppColor.subTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(Insets.xl),
            CardRounded(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.lg,
                vertical: Insets.med,
              ),
              margin: EdgeInsets.zero,
              borderRadius: 0,
              shadow: const [],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSection(
                    icon: AppIcons.note,
                    title: 'Deskripsi',
                  ),
                  verticalSpace(Insets.sm),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                    ),
                    child: Text(
                      controller.postinganCustomerNebeng.value.desc ??
                          "Tidak ada deskripsi",
                      style: TextStyles.text2xs.copyWith(
                        color: const Color(0xFF404040),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(Insets.xl),
            ButtonPrimary(
              margin: EdgeInsets.symmetric(horizontal: Insets.med),
              cornerRadius: 15,
              color: AppColor.primaryColor,
              size: Get.width,
              label: "Ambil Penawaran",
              height: Sizes.xl,
              enable: true,
              onPressed: () {
                showPopUpChoicePng(
                  imageUri: AppIconsPng.confirmData,
                  imageSize: 120.w,
                  labelPositif: "Ambil",
                  onConfirm: () async {
                    if (controller.controllerRiderInfo.hasActivePost.value ==
                        true) {
                      showPopUp(
                        title: 'Penawaran',
                        description:
                            'Mohon untuk dapat menunggu beberapa waktu, pelanggan akan memberikan keputusan persetujuan penawaran nebeng',
                        imageUri: PopUpIcons.information,
                        dismissible: false,
                      );
                      await Future.delayed(const Duration(seconds: 3));
                      controller.createPost();
                      Get.offAllNamed(Routes.main, arguments: 1);
                    } else {
                      showPopUpChoice(
                          title: 'Buat Perjalanan',
                          description:
                              'Anda belum membuat perjalanan, silakan buat dan tentukan perjalanan anda.',
                          imageUri: PopUpIcons.information,
                          onConfirm: () {
                            Get.offAllNamed(Routes.postingPage);
                          },
                          onCancel: () {
                            Get.back();
                          });
                    }
                  },
                  title: "Konfirmasi Penawaran",
                  description:
                      "Mohon pastikan detil penawaran yang ingin anda ambil sudah benar, anda tidak dapat melakukan pembatalan pengambilan penawaran jika penawaran telah diambil",
                );
              },
            ),
            verticalSpace(Insets.xl),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final String icon;
  const TitleSection({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: IconSizes.sm),
        horizontalSpace(Insets.sm),
        Expanded(
          child: Text(
            title,
            style: TextStyles.textSm.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
