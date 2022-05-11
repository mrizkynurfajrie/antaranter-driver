import 'dart:developer';

import 'package:antaranter_driverapp/features/agreement/api_agreement.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/agreement.dart';
import 'package:antaranter_driverapp/response/term_condition.dart';
import 'package:antaranter_driverapp/shared/controller/controller_agreement.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:get/get.dart';

class ControllerAgreement extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerAgreement = Get.find<ControllerAgreementInfo>();

  final ApiAgreement api;
  ControllerAgreement({required this.api});

  var loading = true.obs;
  var statusAgreement = false.obs;
  var agreementData = TermCondition().obs;
  var idAgreement = 0.obs;
  var idRider = 0.obs;
  var status = 0.obs;

  @override
  void onInit() async {
    getAgreementStatus();
    getDataAgreement();

    super.onInit();
  }

  getDataAgreement() async {
    try {
      var response = await api.agreement();
      if (response['success'] == true) {
        agreementData.value = TermCondition.fromJson(response['data']);
        loading.value = false;
      }
    } catch (e) {}
  }

  getAgreementStatus() async {
    try {
      var responseData =
          await api.getAgreement(idRider: controllerRiderInfo.rider.value.id);
      idAgreement.value = responseData['data']['agreement']['id'];
      controllerAgreement.agreement.value =
          Agreement.fromJson(responseData['data']['getagreement']);
      return responseData;
    } catch (e) {
      log(e.toString());
    }
  }

  updateAgreement() async {
    try {
      var updateResult = await api.updateAgreement(
          idRider: controllerRiderInfo.rider.value.id,
          status: status.value,
          idAgreement: idAgreement.value);
    } catch (e) {}
  }
}
