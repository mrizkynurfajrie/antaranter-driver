import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/activity_history/controller_actHistory.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageActivityHistory extends GetView<ControllerActivityHistory> {
  bool isHistory = true;

  PageActivityHistory({Key? key}) : super(key: key);

  _containHistory() {
    return CustomScrollView(
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: Insets.med),
                      width: Get.width * 0.8,
                      height: Get.height * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: AppColor.whiteColor,
                          boxShadow: Shadows.universal),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Image.asset(
                                    AppIcons.roadRoutes,
                                    height: 45,
                                    width: 45,
                                  ),
                                ),
                                horizontalSpace(15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Balikpapan',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    verticalSpace(2),
                                    Text(
                                      'Selesai',
                                      style: TextStyles.inter.copyWith(
                                        fontSize: FontSizes.s12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.successColor,
                                      ),
                                    ),
                                    verticalSpace(2),
                                    Text(
                                      '21 Okt 2022, 00:01',
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _notContainHistory() {
    return const SizedBox(
      child: Text('Belum ada riwayat aktivitas'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'RIWAYAT',
      toolbarTitleColor: AppColor.neutral.shade900,
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.bgPageColor,
      enableBack: true,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: isHistory == true ? _containHistory() : _notContainHistory(),
        ),
      ),
    );
  }
}
