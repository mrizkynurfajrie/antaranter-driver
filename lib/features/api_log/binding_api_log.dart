
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/api_log/controller_api_log.dart';

class BindingApiLog implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerApiLog>(() {
      return ControllerApiLog();
    });
  }
}
