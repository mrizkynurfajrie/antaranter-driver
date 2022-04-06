import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/register/api_register.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  var statusAgreementTerm = false.obs;

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  var cName = TextEditingController();
  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  var isValidName = false.obs;
  var isValidPhoneNumber = false.obs;
  var isValidPassword = false.obs;
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

  var loading = false.obs;

  @override
  void onInit() async {
    showPdf();
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
    isValidForm.value =
        isValidPhoneNumber.value && isValidPassword.value && isValidName.value;
  }

  showPdf() {
    return PDFView(
      filePath: "assets/pdf/loremipsum.pdf",
      enableSwipe: true,
      swipeHorizontal: true,
      autoSpacing: false,
      pageFling: false,
      onRender: (_pages) {
        () {
          pages = _pages;
          isReady = true;
        };
      },
      onError: (error) {
        // print(error.toString());
      },
      onPageError: (page, error) {
        // print('$page: ${error.toString()}}');
      },
      onViewCreated: (PDFViewController pdfViewController){
        _controller.complete(pdfViewController);
      },
      onPageChanged: (int? page, int? total){
        // print('page change : $page/$total');
      },
    );
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
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }
}
