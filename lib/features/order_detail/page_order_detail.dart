import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/order_detail/controller_order_detail.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/cards/card_rounded.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageOrderDetail extends GetView<ControllerOrderDetail> {
  const PageOrderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'IN-TAKE',
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: AppLogos.logoApp(AppLogos.logoColoured),
      child: Obx(
        () => controller.isOrder == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: IconSizes.xxl,
                      width: IconSizes.xxl,
                      child: Image.asset('assets/icons/no_data.png'),
                    ),
                    verticalSpace(Insets.lg),
                    Text(
                      'Kamu belum membagikan perjalanan mu',
                      style: TextStyles.inter.copyWith(
                        fontSize: FontSizes.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardRounded(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.car_rental,
                                        size: IconSizes.med,
                                        color: AppColor.primaryColor,
                                      ),
                                      horizontalSpace(5),
                                      Text(
                                        'Kijang Innova',
                                        style: TextStyles.inter.copyWith(
                                          fontSize: FontSizes.s14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.greyColorLight,
                                        ),
                                      )
                                    ],
                                  ),
                                  horizontalSpace(5),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.money,
                                    size: IconSizes.med,
                                    color: AppColor.primaryColor,
                                  ),
                                  horizontalSpace(5),
                                  Text(
                                    'Rp 100,000',
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.greyColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(9),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.perm_identity,
                                size: IconSizes.med,
                                color: AppColor.primaryColor,
                              ),
                              horizontalSpace(5),
                              Text(
                                '4',
                                style: TextStyles.inter.copyWith(
                                  fontSize: FontSizes.s14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColorLight,
                                ),
                              )
                            ],
                          ),
                          verticalSpace(9),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.my_location,
                                size: IconSizes.med,
                                color: AppColor.greyColor,
                              ),
                              horizontalSpace(5),
                              SizedBox(
                                width: Get.width * 0.25,
                                child: Text(
                                  'Samarinda',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    color: AppColor.greyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.22,
                                child: Text(
                                  '09/03/2022',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  '15:00',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.my_location,
                                size: IconSizes.med,
                                color: AppColor.primaryColor,
                              ),
                              horizontalSpace(5),
                              SizedBox(
                                width: Get.width * 0.25,
                                child: Text(
                                  'Balikpapan',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    color: AppColor.greyColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.22,
                                child: Text(
                                  '09/03/2022',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Text(
                                  '19:00',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(Insets.xl),
                    SingleChildScrollView(
                      child: Container(
                        height: Get.height * 0.35,
                        width: Get.width,
                        margin: EdgeInsets.symmetric(horizontal: Insets.sm),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: Get.height * 0.8,
                                    width: Get.width * 0.95,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: Insets.sm),
                                          width: Get.width * 0.8,
                                          height: Get.height * 0.06,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: AppColor.whiteColor,
                                              boxShadow: Shadows.universal),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3,
                                                        horizontal: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        verticalSpace(2),
                                                        Text(
                                                          'Anas Kun',
                                                          style: TextStyles
                                                              .inter
                                                              .copyWith(
                                                            fontSize:
                                                                FontSizes.s14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColor
                                                                .greyColor,
                                                          ),
                                                        ),
                                                        verticalSpace(2),
                                                        Text(
                                                          '0852525252525',
                                                          style: TextStyles
                                                              .inter
                                                              .copyWith(
                                                            fontSize:
                                                                FontSizes.s14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColor
                                                                .greyColorLight,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '#12345',
                                                      style: TextStyles.inter
                                                          .copyWith(
                                                        fontSize: FontSizes.s14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColor
                                                            .greyColorLight,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
