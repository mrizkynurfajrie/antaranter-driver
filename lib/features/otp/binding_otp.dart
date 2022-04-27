import 'dart:ffi';

import 'package:antaranter_driverapp/features/otp/api_otp.dart';
import 'package:antaranter_driverapp/features/otp/controller_otp.dart';
import 'package:get/get.dart';

class BindingOtp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerOtp>(() {
      return ControllerOtp(api: ApiOtp());
    });
  }
}