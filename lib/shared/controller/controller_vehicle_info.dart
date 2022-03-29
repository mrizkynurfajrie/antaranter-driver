import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/nebeng_rider.dart';

class ControllerVehicleInfo extends GetxController {
  var vehicle = NebengRider().obs;

  @override
  void onInit() async {
    super.onInit();
    await setVehicleData();
  }

  setVehicleData() async {
    var data = await Api2().getVehicle();
    if (data != null) {
      vehicle.value = NebengRider.fromJson(data);
    }
  }
}