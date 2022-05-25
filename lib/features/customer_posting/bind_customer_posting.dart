import 'package:antaranter_driverapp/features/customer_posting/api_custtomer_posting.dart';
import 'package:antaranter_driverapp/features/customer_posting/controller_customer_posting.dart';
import 'package:get/get.dart';

class BindingCustomerPosting implements Bindings {
  void dependencies() {
    Get.lazyPut<ControllerCustomerPosting>(
        () => ControllerCustomerPosting(api: ApiCustomerPosting()));
  }
}
