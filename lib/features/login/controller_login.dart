import 'dart:developer';
import 'dart:io';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/login/api_login.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/main_rider.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerLogin extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiLogin api;
  ControllerLogin({required this.api});

  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var validPhoneNumber = false.obs;
  var validPassword = false.obs;
  var isValidForm = false.obs;

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;
  var fcm = "dummytoken";
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  onInit() {
    super.onInit();
    // checkLogin();
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
      validPhoneNumber.value =
          isValidPhoneNumber(phoneNumber: cPhoneNumber.text);
      validateForm();
    });
    cPassword.addListener(() {
      validPassword.value = isValidPassword(password: cPassword.text);
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = validPhoneNumber.value && validPassword.value;
  }

  ourWa() async {
    // var editedPhone = phoneNum!.replaceFirst(RegExp(r'^0+'), "");
    var whatsapp = "+6281256529355";
    var whatsappURlAndroid =
        "https://wa.me/$whatsapp?text=${Uri.parse("halo admin AntarAnter, mohon bantuannya saya ingin mengatur ulang password akun saya")}";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "whatsapp no installed");
      }
    } else {
      // android , web

      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        Get.snackbar('Attention', "whatsapp no installed android");
      }
    }
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
          await Api2().setRider(rider: detailUser);
          var getDetailUser = await Api2().getRider();
          controllerRiderInfo.rider.value = MainRider.fromJson(detailUser);
          log(getDetailUser.toString());
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
      showPopUpError(
        errorTitle: 'Kesalahan',
        errorMessage: e.toString(),
      );
      loading.value = false;
    }
  }

  checkLogin() async {
    var statusLogin = await Api2().getLoginStatus();
    await Future.delayed(const Duration(seconds: 2));
    log('cek status : $statusLogin');
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    } else {
      Get.offNamed(Routes.login);
    }
  }
}
