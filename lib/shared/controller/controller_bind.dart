import 'package:get/get.dart';
import 'package:intake_rider/features/login/api_login.dart';
import 'package:intake_rider/features/login/controller_login.dart';
import 'package:intake_rider/shared/controller/controller_notification.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';
// import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    // Get.put(ControllerUtility());
    // Get.put(ControllerVehicleInfo());
    Get.put(ControllerNotification());
    Get.put(ControllerVehicleInfo());
    Get.put(ControllerRiderInfo());
    Get.put(ControllerLogin(api: ApiLogin()));
    // Get.put(ControllerHelp(apiHelp: ApiHelp()));
    // Get.put(ControllerLastTrx(api: ApiLastTrx()));
  }
}
