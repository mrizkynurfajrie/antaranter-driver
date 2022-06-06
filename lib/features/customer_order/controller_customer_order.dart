import 'package:antaranter_driverapp/features/customer_order/api_customer_order.dart';
import 'package:antaranter_driverapp/response/nebeng_customer_response.dart';
import 'package:antaranter_driverapp/shared/controller/controller_users.dart';
import 'package:get/get.dart';

class ControllerCustomerOrder extends GetxController {
  final ApiCustomerOrder api;
  ControllerCustomerOrder({required this.api});

  var controllerUserInfo = Get.find<ControllerUsers>();

  var postinganCustomerNebeng = NebengCustomerResponse().obs;

  @override
  void onInit() {
    super.onInit();
    postinganCustomerNebeng.value = NebengCustomerResponse.fromArguments(Get.arguments);
  }
}
