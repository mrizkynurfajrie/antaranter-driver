import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/register/api_register.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/helpers/utils.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var statusAgreementTerm = false.obs;

  var cName = TextEditingController();
  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var isValidName = false.obs;
  var isValidPhoneNumber = false.obs;
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
      isValidPhoneNumber.value = cPhoneNumber.text.isNotEmpty;
      validateForm();
    });
    cPassword.addListener(() {
      isValidPassword.value = cPassword.text.isNotEmpty;
      validateForm();
    });
    cName.addListener(() {
      isValidName.value = cName.text.isNotEmpty;
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = isValidPhoneNumber.value &&
        isValidPassword.value &&
        isValidName.value;
  }

  register() async {
    dismisKeyboard();
    loading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      var res = await api.userRegister(
        name: cName.text,
        password: cPassword.text,
        phone: cPhoneNumber.text,
      );

      if (res['success'] == true) {
        loading.value = false;
        Get.offAllNamed(Routes.regsuccess);
        await Future.delayed(const Duration(seconds: 2));
        var phoneNumber = res['data']['newRider']['phone'];
        Get.offAllNamed(Routes.login,
            arguments: phoneNumber);
      } else {
        var firstError = res['errors'][0];
        throw firstError['message'];
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }
}
