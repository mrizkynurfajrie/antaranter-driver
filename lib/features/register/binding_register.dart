import 'package:get/get.dart';
import 'package:intake_rider/features/register/api_register.dart';
import 'package:intake_rider/features/register/controller_register.dart';

class BindingRegister implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerRegister>(() {
      return ControllerRegister(api: ApiRegister());
    });
  }
}
