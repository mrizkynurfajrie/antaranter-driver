import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/features/home/controller_home.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerHome>(() => ControllerHome(api: ApiHome()));
  }
}
