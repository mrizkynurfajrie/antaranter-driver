import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/login/api_login.dart';
import 'package:intake_rider/shared/helpers/utils.dart';
import 'package:intake_rider/shared/widgets/others/show_dialog.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var isValidUsername = false.obs;
  var isValidPassword = false.obs;
  var isValidForm = false.obs;

  var loading = false.obs;

  @override
  onInit() {
    super.onInit();
    // getUsernameAndCountryCode();
    // getCountryCode();
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
      isValidUsername.value = cPhoneNumber.text.isNotEmpty;
      validateForm();
    });
    cPassword.addListener(() {
      isValidPassword.value = cPassword.text.isNotEmpty;
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = isValidUsername.value && isValidPassword.value;
  }

  login() async {
    dismisKeyboard();
    try {
      // var status = await Permission.location.status;

      //if (status.isGranted) {
      loading(true);
      var r = await api.userLogin(
          username: cPhoneNumber.text, password: cPassword.text);
      loading(false);
      if (r != null) {
        // await Api1().setTokenWithTimer(r['access_token']);
        // await Api1().setTokenRefresh(tokenRefresh: r['refresh_token']);
        // await Api1().setUserName(userName: selectedCountry + cPhoneNumber.text);
        // await Api1().setPhoneNumber(phoneNumber: cPhoneNumber.text);
        // await Api1().setReferral(s: r['referral_code']);
        // await Api1().setAccountType(accountType: r['account_type']);
        // await Api1().setFirstOpen(s: '1');
        // Get.find<ControllerUserInfo>().setAccountType(r['account_type']);
        // Get.offAllNamed(Routes.PAGE_HOME);
      }

      // } else {
      //   showPopUp(
      //       title: "Akses GPS",
      //       description:
      //           "Aplikasi memerlukan akses GPS supaya dapat mengoptimalkan layanan. Data akan dijamin penggunaannya hanya untuk kepentingan sistem aplikasi.",
      //       labelButton: "OK",
      //       onPress: () {
      //         Get.back();
      //         Permission.location.request().;
      //       });
      // }
    } catch (_) {
      loading(false);
      log(_.toString());
      showPopUpError(errorMessage: _.toString());
    }
  }
}
