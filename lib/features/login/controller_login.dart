import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/login/api_login.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/rider.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
// import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';
import 'package:intake_rider/shared/helpers/utils.dart';
import 'package:intake_rider/routes/app_routes.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var isValidPhoneNumber = false.obs;
  var isValidPassword = false.obs;
  var isValidForm = false.obs;

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  // var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;
  var fcm = "dummytoken";
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  onInit() {
    super.onInit();
    checkLogin();
    formValidationListener();
  }

  @override
  onClose() {
    super.onClose();
    cPhoneNumber.dispose();
    cPassword.dispose();
  }

  formValidationListener() {
    cPhoneNumber.addListener(() {
      isValidPhoneNumber.value = cPhoneNumber.text.isNotEmpty;
      validateForm();
    });
    cPassword.addListener(() {
      isValidPassword.value = cPassword.text.isNotEmpty;
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = isValidPhoneNumber.value && isValidPassword.value;
  }

  login() async {
    dismisKeyboard();
    loading.value = true;
    try {
      var fcmToken = await messaging.getToken();
      var loginResult = await api.userLogin(
          phoneNumber: cPhoneNumber.text,
          password: cPassword.text,
          fcm: fcmToken ?? '00');

      loading(false);
      if (loginResult != null) {
        if (loginResult['success'] == true) {
          var detailUser = loginResult["data"]["rider"];
          controllerRiderInfo.rider.value = Rider.fromJson(detailUser);
          await Api2().setRider(rider: detailUser);
          var tokenUser = loginResult["data"]["token"];
          token.value = tokenUser;

          await Api2().setToken(token: token.value);
          loginStatus = true;
          await Api2().setIsLogin(isLogin: loginStatus);
          Get.offNamed(Routes.main);
        } else {
          var firstError = loginResult['errors'][0];
          throw firstError['message'];
        }
      }
      loading.value = false;
    } catch (e) {
      log(e.toString());
      Get.snackbar("Kesalahan", e.toString());
      loading.value = false;
    }
  }

  checkLogin() async {
    var statusLogin = await Api2().getLoginStatus();
    await Future.delayed(const Duration(seconds: 2));
    log('cek status : ' + statusLogin.toString());
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
