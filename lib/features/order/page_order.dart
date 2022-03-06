import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/constants/assets.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'controller_order.dart';

class PageOrder extends GetView<ControllerOrder> {
  const PageOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: 'IN-TAKE',
      padding: EdgeInsets.zero,
      toolbarColor: AppColor.bgPageColor,
      backgroundColor: AppColor.bgPageColor,
      enableBack: false,
      center: AppLogos.logoApp(AppLogos.logoColoured),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}
