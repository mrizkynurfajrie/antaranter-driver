import 'package:antaranter_driverapp/features/order_history/page_order_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/home/page_home.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/page_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  late PageController pageController;
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageNebengPostingDetail(),
    PageOrderHistory(),
    const PageProfile(),
  ];
  void changePage(index) => currentPage.value = index;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  @override
  void onReady() async {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
      pageController.jumpToPage(pageArg);
    }
  }
}
