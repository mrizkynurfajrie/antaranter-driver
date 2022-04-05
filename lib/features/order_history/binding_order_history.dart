import 'package:get/get.dart';
import 'package:intake_rider/features/order_history/api_order_history.dart';
import 'package:intake_rider/features/order_history/controller_order_history.dart';


class BindingOrderHistory implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerOrderHistory>(
        () => ControllerOrderHistory(api: ApiOrderHistory()));
  }
}
