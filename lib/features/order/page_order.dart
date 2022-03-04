import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/widgets/pages/page_decoration_top.dart';
import 'controller_order.dart';

class PageOrder extends GetView<ControllerOrder> {
  const PageOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
    );
  }
}
