import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/home/page_home.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/page_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageNebengPostingDetail(),
    const PageProfile(),
  ];
  void changePage(index) => currentPage.value = index;

  @override
  void onReady() async {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
    }
  }
}
