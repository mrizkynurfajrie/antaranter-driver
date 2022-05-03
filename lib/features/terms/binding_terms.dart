import 'package:antaranter_driverapp/features/terms/api_terms.dart';
import 'package:antaranter_driverapp/features/terms/controller_terms.dart';
import 'package:get/get.dart';

class BindingTermsProfile implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<ControllerTermsProfile>(() => ControllerTermsProfile(api: ApiTermsProfile()));
  }
}