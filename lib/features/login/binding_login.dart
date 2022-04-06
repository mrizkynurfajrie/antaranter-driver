import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/login/api_login.dart';
import 'package:antaranter_driverapp/features/login/controller_login.dart';

class BindingLogin implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerLogin>(() {
      return ControllerLogin(api: ApiLogin());
    });
  }
}
