import 'dart:developer';

import 'package:antaranter_driverapp/features/terms/api_terms.dart';
import 'package:antaranter_driverapp/response/term_condition.dart';
import 'package:get/get.dart';

class ControllerTermsProfile extends GetxController {
  final ApiTermsProfile api;
  ControllerTermsProfile({required this.api});

  var terms = TermCondition().obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getDataTerms();
  }

  getDataTerms() async {
    try{
      var response = await api.terms();
      if(response['success'] == true) {
        terms.value = TermCondition.fromJson(response['data']);
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
