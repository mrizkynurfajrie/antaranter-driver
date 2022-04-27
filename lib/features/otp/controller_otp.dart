import 'dart:async';
import 'dart:developer';

import 'package:antaranter_driverapp/features/otp/api_otp.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ControllerOtp extends GetxController {
  final ApiOtp api;
  ControllerOtp({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  late TextEditingController otpController;
  late StreamController<ErrorAnimationType> errorController;

  final formkey = GlobalKey<FormState>();

  var currentText = ''.obs;
  var showResendOtpButton = false.obs;
  var initialTimer = 60.obs;

  @override
  void onInit() {
    otpController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  sendOtp() async {
    try {} catch (e) {
      log(e.toString());
      showPopUpError(errorTitle: 'OTP Failed', errorMessage: e.toString());
    }
  }
}
