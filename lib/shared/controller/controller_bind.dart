import 'package:get/get.dart';
import 'package:intakemobile/features/login/api_login.dart';
import 'package:intakemobile/features/login/controller_login.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    // Get.put(ControllerUtility());
    // Get.put(ControllerUserInfo(api: ApiUserInfo()));
    Get.put(ControllerLogin(api: ApiLogin()));
    // Get.put(ControllerHelp(apiHelp: ApiHelp()));
    // Get.put(ControllerLastTrx(api: ApiLastTrx()));
  }
}
