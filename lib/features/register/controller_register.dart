import 'dart:async';
import 'dart:developer';
import 'package:antaranter_driverapp/response/term_condition.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/register/api_register.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  var statusAgreementTerm = false.obs;

  var termCondition = TermCondition().obs;

  var cName = TextEditingController();
  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var validName = false.obs;
  var validPhoneNumber = false.obs;
  var validPassword = false.obs;
  var isValidForm = false.obs;

  var statusNebeng = 0.obs;
  var sim = "12345".obs;
  var simPict = "xxxxx.jpg".obs;
  var stnkPict = "xxxxx.jpg".obs;
  var rating = 0.obs;
  var vehicleVar = "merek".obs;
  var platNum = "kt".obs;
  var vehicleCol = "warna".obs;
  var idRider = 0.obs;
  bool isReady = false;
  int? pages = 0;

  var loading = true.obs;

  @override
  void onInit() async {
    getDataTerm();
    formValidationListener();
    var rider = await Api2().getRider();
    idRider.value = rider["id"] ?? 0;
    super.onInit();
  }

  @override
  onClose() {
    super.onClose();
    cName.dispose();
    cPhoneNumber.dispose();
    cPassword.dispose();
  }

  getDataTerm() async {
    try {
      var res = await api.termNebeng();
      if (res["success"] == true) {
        termCondition.value = TermCondition.fromJson(res['data']);
        loading.value = false;
      }
    } catch (e) {}
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
    cName.addListener(() {
      validName.value = isValidName(name: cName.text);
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value =
        validPhoneNumber.value && validPassword.value && validName.value;
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
        var riderId = res['data']['newRider']['id'];
        var resNebengRider = await api.createNebengRider(
          idRider: riderId,
        );
        log(resNebengRider.toString());
        Get.offAllNamed(Routes.login, arguments: phoneNumber);
      } else {
        var firstError = res['errors'][0];
        throw firstError['message'];
      }
    } catch (e) {
      loading.value = false;
      showPopUp(
          title: 'Terjadi Kesalahan',
          description: e.toString(),
          imageUri: PopUpIcons.error);
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    }
  }
}
