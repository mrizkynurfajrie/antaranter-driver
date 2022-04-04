import 'dart:developer';

import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/response/home_response.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();

  var loading = false.obs;
  var homeResponse = HomeResponse().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  void getData() async {
    try {
      var res = await api.riderHome(controllerRiderInfo.rider.value.id ?? 0);
      if (res["success"] == true) {
        homeResponse.value = HomeResponse.fromJson(res["data"]);
        if (homeResponse.value.rider != null) {
          controllerRiderInfo.rider.value = homeResponse.value.rider!;
        }
      }
      controllerRiderInfo.rider.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Kesalahan", "Terjadi Kesalahan");
    }
  }
}
