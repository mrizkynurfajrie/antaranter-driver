import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/login/api_login.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/shared/helpers/utils.dart';
import 'package:intake_rider/shared/widgets/others/show_dialog.dart';
import 'package:intake_rider/response/loginResponse.dart';
import 'package:intake_rider/routes/app_routes.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;

  @override
  onInit() {
    super.onInit();
    checkLogin();
  }

  @override
  onClose() {
    super.onClose();
    cPhoneNumber.dispose();
    cPassword.dispose();
  }

  login() async {
    dismisKeyboard();
    try {
      loading(true);
      var loginResult = await api.userLogin(
          phoneNumber: cPhoneNumber.text, password: cPassword.text);
      loading(false);
      if (loginResult != null) {
        var detailUser = loginResult["data"]["rider"];
        loginResponse result = loginResponse.fromJson(detailUser);
        var tokenUser = loginResult["data"]["token"];
        token.value = tokenUser;
        await Api2().setToken(token: token.value);
        loginStatus = true;
        await Api2().setIsLogin(isLogin: loginStatus);
        Get.offNamed(Routes.main);
      }
      loading(false);
    } catch (e) {
      log(e.toString());
      loading(false);
    }
  }

  checkLogin() async {
    var statusLogin = await Api2().getLoginStatus();
    log('cek status : ' + statusLogin.toString());
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    }
  }
}
