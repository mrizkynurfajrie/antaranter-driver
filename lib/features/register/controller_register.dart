import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/register/api_register.dart';
import 'package:intake_rider/shared/helpers/utils.dart';
import 'package:intake_rider/shared/widgets/others/show_dialog.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var cName = TextEditingController();
  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var isValidName = false.obs;
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
    cName.dispose();
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
    cName.addListener(() {
      isValidName.value = cName.text.isNotEmpty;
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
