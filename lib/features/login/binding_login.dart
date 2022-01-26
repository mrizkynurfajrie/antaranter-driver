import 'package:get/get.dart';
import 'package:intakemobile/features/login/api_login.dart';
import 'package:intakemobile/features/login/controller_login.dart';

class BindingLogin implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerLogin>(() {
      return ControllerLogin(api: ApiLogin());
    });
  }
}
