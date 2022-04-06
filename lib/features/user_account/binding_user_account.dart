import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/user_account/api_user_account.dart';
import 'package:antaranter_driverapp/features/user_account/controller_user_account.dart';

class BindingUserAccount implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerUserAccount>(
        () => ControllerUserAccount(api: ApiUserAccount()));
  }
}
