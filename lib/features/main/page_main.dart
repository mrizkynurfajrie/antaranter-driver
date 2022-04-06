import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/main/controller_main.dart';
import 'package:intake_rider/shared/widgets/buttons/custom_bottom_navbar.dart';

class PageMain extends GetView<ControllerMain> {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Obx(() => controller.pages.elementAt(
              controller.currentPage.value,
            )),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.currentPage.value,
          onTap: (pageIndex) {
            controller.changePage(pageIndex);
          },
        ),
      ),
      // Obx(
      //   () => BottomNavigationBar(
      //     selectedItemColor: AppColor.primaryColor.shade400,
      //     currentIndex: controller.currentPage.value,
      //     onTap: (index) => controller.changePage(index),
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: "Beranda",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.departure_board),
      //         label: "Perjalanan",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: "Profil",
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
