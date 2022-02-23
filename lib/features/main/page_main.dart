import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/main/controller_main.dart';
import 'package:intake_rider/shared/constants/colors.dart';

class PageMain extends GetView<ControllerMain> {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => controller.pages.elementAt(
              controller.currentPage.value,
            )),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: AppColor.primaryColor.shade400,
          currentIndex: controller.currentPage.value,
          onTap: (index) => controller.changePage(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pedal_bike),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
