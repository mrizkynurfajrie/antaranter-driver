import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/vehicle_account/api_vehicle_account.dart';
import 'package:antaranter_driverapp/features/vehicle_account/controller_vehicle_account.dart';

class BindingVehicleAccount implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerVehicleAccount>(
        () => ControllerVehicleAccount(api: ApiVehicleAccount()));
  }
}
