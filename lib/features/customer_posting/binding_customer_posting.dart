import 'package:antaranter_driverapp/features/customer_posting/api_customer_posting.dart';
import 'package:antaranter_driverapp/features/customer_posting/controller_customer_posting.dart';
import 'package:get/get.dart';

class BindingCustomerPosting implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerCustomerPosting>(
        () => ControllerCustomerPosting(api: ApiCustomerPosting()));
  }
}
