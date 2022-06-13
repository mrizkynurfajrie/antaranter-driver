import 'package:antaranter_driverapp/features/posting/customer_posting/api_customer_posting.dart';
import 'package:antaranter_driverapp/features/posting/customer_posting/controller_customer_posting.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/api_nebeng_posting.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/controller_nebeng_posting.dart';
import 'package:get/get.dart';

class BindingPosting implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerNebengPosting>(
        () => ControllerNebengPosting(api: ApiNebengPosting()));
    Get.lazyPut<ControllerCustomerPosting>(
        () => ControllerCustomerPosting(api: ApiCustomerPosting()));
  }
}
