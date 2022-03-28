import 'dart:developer';

import 'package:get/get.dart';
import 'package:intake_rider/response/Balance.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';

import 'api_saldo.dart';

class ControllerSaldo extends GetxController {
  final ApiSaldo api;
  ControllerSaldo({required this.api});

  var balance = Balance().obs;

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  var loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    loading.value = true;
    try {
      print(controllerRiderInfo.rider.value.id);
      var res = await api.getBalance(
        id: controllerRiderInfo.rider.value.id ?? 0,
      );
      print(res);
      if (res['success'] == true) {
        balance.value = Balance.fromJson(res['data']);
        loading.value = false;
      }else{
        
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }
}
