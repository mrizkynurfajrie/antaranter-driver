import 'package:antaranter_driverapp/response/agreement.dart';
import 'package:antaranter_driverapp/response/balance.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/framework/api2.dart';

class ControllerBalanceInfo extends GetxController {
  var balance = Balance().obs;

  @override
  void onInit() async {
    super.onInit();
    await setAgreementData();
  }

  setAgreementData() async {
    var data = await Api2().getBalance();
    if (data != null) {
      balance.value = Balance.fromJson(data);
    }
  }
}