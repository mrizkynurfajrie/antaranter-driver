import 'dart:developer';

import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/nebeng_rider.dart';
import 'package:intake_rider/response/rider.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();

  var loading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      var res = await api.home(id: controllerRiderInfo.rider.value.id ?? 0);
      if (res['success'] == true) {
        log(res.toString());
        controllerRiderInfo.rider.value = Rider.fromJson(res['data']['rider']);
        log("disini");
        controllerVehicleInfo.vehicle.value =
            NebengRider.fromJson(res['data']['nebeng_rider']);
      }
      controllerRiderInfo.rider.refresh();
      controllerVehicleInfo.vehicle.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Terjadi kesalahan");
    }
  }
}
