import 'package:antaranter_driverapp/features/customer_order/api_customer_order.dart';
import 'package:antaranter_driverapp/features/customer_order/controller_customer_order.dart';
import 'package:get/get.dart';

class BindingCustomerOrder implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<ControllerCustomerOrder>(() => ControllerCustomerOrder(api: ApiCustomerOrder()));
  }
}