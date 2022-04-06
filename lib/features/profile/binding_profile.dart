import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/profile/api_profile.dart';
import 'package:antaranter_driverapp/features/profile/controller_profile.dart';

class BindingProfile implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerProfile>(() => ControllerProfile(api: ApiProfile()));
  }
}
