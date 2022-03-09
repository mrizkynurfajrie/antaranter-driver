import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/features/home/controller_home.dart';
import 'package:intake_rider/features/main/controller_main.dart';
import 'package:intake_rider/features/order_detail/api_order_detail.dart';
import 'package:intake_rider/features/order_detail/controller_order_detail.dart';

class BindingMain implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerMain>(() => ControllerMain());
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
    Get.lazyPut<ControllerOrderDetail>(() => ControllerOrderDetail(api: ApiOrderDetail()));
  }
}
