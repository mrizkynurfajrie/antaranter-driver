import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/response/balance.dart';
import 'package:antaranter_driverapp/response/transaction.dart';
import 'package:antaranter_driverapp/response/error_response.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';

import 'api_saldo.dart';

class ControllerSaldo extends GetxController
    with StateMixin<List<Transaction>> {
  final ApiSaldo api;
  ControllerSaldo({required this.api});

  var balance = Balance().obs;
  var listTransaction = List<Transaction>.empty().obs;

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  late ScrollController scrollController;

  var loading = true.obs;
  var balancedValue = 0.obs;

  var nominalTopUp = 50.obs;

  var thousand = 1000;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    getDataBalance();
    getDataTransaction();
  }

  Future<void> refreshData() async {
    getDataBalance();
    getDataTransaction();
  }

  void getDataBalance() async {
    loading.value = true;
    try {
      // print(controllerRiderInfo.rider.value.id);
      var res = await api.getBalance(
        id: controllerRiderInfo.rider.value.id ?? 0,
      );
      // print(res);
      if (res['success'] == true) {
        balance.value = Balance.fromJson(res['data']);
        loading.value = false;
      } else {
        throw "Status response false";
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }

  void getDataTransaction() async {
    change(null, status: RxStatus.loading());
    try {
      // print(controllerRiderInfo.rider.value.id);
      var res = await api.getTransaction(
        id: controllerRiderInfo.rider.value.id ?? 0,
      );
      // print(res);
      log("data res : $res");
      if (res['success'] == true) {
        var data = res['data'];
        var resultTransaction =
            (data as List).map((data) => Transaction.fromJson(data)).toList();
        // print(resultTransaction.isNotEmpty);
        if (resultTransaction.isNotEmpty) {
          listTransaction.clear();
          listTransaction.addAll(resultTransaction);
          listTransaction
              .sort(((a, b) => b.datetimeSaldo!.compareTo(a.datetimeSaldo!)));
          change(listTransaction, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        // print(res['errors']);
        var dataError = res['errors'];
        var resultError = (dataError as List)
            .map((data) => ErrorResponse.fromJson(data))
            .toList();

        if (resultError.first.message?.code == "Transactions_NOT_FOUND") {
          change(null, status: RxStatus.empty());
        } else {
          throw "${resultError.first.message?.message}";
        }
      }
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }

  int uniqueNominalDigit() {
    var uniqueNomDig = nominalTopUp.value * 1000;
    return uniqueNomDig;
  }
}
