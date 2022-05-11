import 'package:antaranter_driverapp/features/agreement/api_agreement.dart';
import 'package:antaranter_driverapp/response/term_condition.dart';
import 'package:get/get.dart';

class ControllerAgreement extends GetxController {
  final ApiAgreement api;
  ControllerAgreement({required this.api});

  var loading = true.obs;
   var statusAgreement = false.obs;
  var agreement = TermCondition().obs;

  @override
  void onInit () {
    super.onInit();
    getDataAgreement();
  }

  getDataAgreement() async {
    try{
      var response = await api.agreement();
      if (response['success'] == true) {
        agreement.value = TermCondition.fromJson(response['data']);
        loading.value = false;
      }
    } catch (e) {}
  }
  
}