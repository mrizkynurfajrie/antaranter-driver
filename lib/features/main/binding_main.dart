import 'package:antaranter_driverapp/features/order_history/api_order_history.dart';
import 'package:antaranter_driverapp/features/order_history/controller_order_history.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/home/api_home.dart';
import 'package:antaranter_driverapp/features/home/controller_home.dart';
import 'package:antaranter_driverapp/features/main/controller_main.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/controller_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/features/profile/api_profile.dart';
import 'package:antaranter_driverapp/features/profile/controller_profile.dart';

class BindingMain implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerMain>(() => ControllerMain());
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
    Get.lazyPut<ControllerNebengPostingDetail>(
        () => ControllerNebengPostingDetail(api: ApiNebengPostingDetail()));
    Get.lazyPut<ControllerOrderHistory>(
        () => ControllerOrderHistory(api: ApiOrderHistory()));
    Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}
