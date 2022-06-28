import 'package:antaranter_driverapp/features/splash/api_splash.dart';
import 'package:antaranter_driverapp/features/splash/controller_splash.dart';
import 'package:antaranter_driverapp/shared/controller/controller_agreement.dart';
import 'package:antaranter_driverapp/shared/controller/controller_balance.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/login/api_login.dart';
import 'package:antaranter_driverapp/features/login/controller_login.dart';
import 'package:antaranter_driverapp/shared/controller/controller_notification.dart';
import 'package:antaranter_driverapp/shared/controller/controller_postingan.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_users.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';
// import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    // Get.put(ControllerUtility());
    // Get.put(ControllerVehicleInfo());
    Get.put(ControllerPostingan());
    Get.put(ControllerUsers());
    Get.put(ControllerNotification());
    Get.put(ControllerVehicleInfo());
    Get.put(ControllerRiderInfo());
    Get.put(ControllerLogin(api: ApiLogin()));
    Get.put(ControllerSplash(api: ApiSplash()));
    Get.put(ControllerAgreementInfo());
    Get.put(ControllerBalanceInfo());
    // Get.put(ControllerHelp(apiHelp: ApiHelp()));
    // Get.put(ControllerLastTrx(api: ApiLastTrx()));
  }
}
