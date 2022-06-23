import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/order_history/controller_order_history.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/widgets/others/loading_indicator.dart';
import 'package:antaranter_driverapp/shared/widgets/pages/page_decoration_top.dart';

class PageOrderHistory extends GetView<ControllerOrderHistory> {
  bool isHistory = true;

  PageOrderHistory({Key? key}) : super(key: key);

  _containHistory() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.listHistory.length,
                itemBuilder: (context, index) {
                  return CardRounded(
                    margin: EdgeInsets.only(bottom: Insets.med),
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    width: Get.width,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Image.asset(
                                AppIcons.roadRoutes,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            horizontalSpace(15),
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: Get.width * 0.60.w,
                                  child: Text(
                                    "${controller.listHistory[index].cityOrigin} - ${controller.listHistory[index].cityDestination}",
                                    style: TextStyles.inter.copyWith(
                                      fontSize: FontSizes.s14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                verticalSpace(2),
                                Text(
                                  controller.listHistory[index]
                                              .status ==
                                          3
                                      ? 'Selesai'
                                      : 'Dibatalkan',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    fontWeight: FontWeight.w500,
                                    color: controller.listHistory[index]
                                                .status ==
                                            3
                                        ? AppColor.successColor
                                        : AppColor.errorColor,
                                  ),
                                ),
                                verticalSpace(2),
                                Text(
                                  controller.listHistory[index]
                                              .status ==
                                          3
                                      ? FormatDateTime
                                          .formatDateWithoutHour(
                                          value: controller
                                              .listHistory[index]
                                              .datetimeFinish!,
                                        )
                                      : '-',
                                  style: TextStyles.inter.copyWith(
                                    fontSize: FontSizes.s12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColorLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _notContainHistory() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: IconSizes.xxl,
            width: IconSizes.xxl,
            child: Image.asset('assets/icons/no_data.png'),
          ),
          verticalSpace(5.h),
          SizedBox(
            width: Get.width * 0.7,
            child: Text(
              'Anda belum memiliki riwayat perjalanan',
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  _onErrorHistory(String e) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: IconSizes.xxl,
            width: IconSizes.xxl,
            child: Image.asset('assets/icons/no_data.png'),
          ),
          verticalSpace(5.h),
          SizedBox(
            width: Get.width * 0.7,
            child: Text(
              e,
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: false,
      center: Center(
          child: Text('Riwayat Nebeng',
              style: TextStyles.inter.copyWith(
                fontSize: FontSizes.s16,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w500,
              ))),
      child: controller.obx(
        (state) => _containHistory(),
        onEmpty: _notContainHistory(),
        onLoading: loadingIndicator(context),
        onError: (e) => _onErrorHistory(e.toString()),
      ),
    );
  }
}
