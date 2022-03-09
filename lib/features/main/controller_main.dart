import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/home/page_home.dart';
import 'package:intake_rider/features/order_detail/page_order_detail.dart';
import 'package:intake_rider/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageOrderDetail(),
    const PageProfile(),
  ];
  void changePage(index) => currentPage.value = index;
}
