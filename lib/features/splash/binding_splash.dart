import 'package:antaranter_driverapp/features/splash/api_splash.dart';
import 'package:antaranter_driverapp/features/splash/controller_splash.dart';
import 'package:get/get.dart';

class BindingSplash implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ControllerSplash>(() => ControllerSplash(api: ApiSplash()));
  }
}