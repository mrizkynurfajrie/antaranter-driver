import 'package:antaranter_driverapp/features/register/agreement/api_agreement.dart';
import 'package:antaranter_driverapp/features/register/agreement/controller_agreement.dart';
import 'package:get/get.dart';

class BindingAgreement implements Bindings {
  @override
  void dependencies () {
    Get.lazyPut<ControllerAgreement>(() => ControllerAgreement(api: ApiAgreement()));
  }
}