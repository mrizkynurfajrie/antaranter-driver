import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/activity_history/controller_actHistory.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';

class PageActivityHistory extends GetView<ControllerActivityHistory> {
  const PageActivityHistory({Key? key}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Testing Riwayat'),
          ],
        ),
      ),
    );
  }
}
