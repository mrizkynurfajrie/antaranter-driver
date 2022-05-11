import 'package:antaranter_driverapp/features/agreement/api_agreement.dart';
import 'package:antaranter_driverapp/features/agreement/controller_agreement.dart';
import 'package:get/get.dart';

class BindingAgreement implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<ControllerAgreement>(() => ControllerAgreement(api: ApiAgreement()));
  }
}