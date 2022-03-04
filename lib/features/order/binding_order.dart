import 'package:get/get.dart';
import 'package:intake_rider/features/order/api_order.dart';
import 'package:intake_rider/features/order/controller_order.dart';

class BindingOrder implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerOrder>(() => ControllerOrder(api: ApiOrder()));
  }
}
