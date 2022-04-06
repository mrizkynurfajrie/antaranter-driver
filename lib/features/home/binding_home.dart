import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/home/api_home.dart';
import 'package:antaranter_driverapp/features/home/controller_home.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
  }
}
