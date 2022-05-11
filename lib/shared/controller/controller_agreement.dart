import 'package:antaranter_driverapp/response/agreement.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/framework/api2.dart';

class ControllerAgreementInfo extends GetxController {
  var agreement = Agreement().obs;

  @override
  void onInit() async {
    super.onInit();
    await setAgreementData();
  }

  setAgreementData() async {
    var data = await Api2().getVehicle();
    if (data != null) {
      agreement.value = Agreement.fromJson(data);
    }
  }
}