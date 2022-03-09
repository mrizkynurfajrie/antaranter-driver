import 'package:get/get.dart';
import 'package:intake_rider/features/order_detail/api_order_detail.dart';
import 'package:intake_rider/features/order_detail/controller_order_detail.dart';

class BindingOrderDetail implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerOrderDetail>(() => ControllerOrderDetail(api: ApiOrderDetail()));
  } 
}