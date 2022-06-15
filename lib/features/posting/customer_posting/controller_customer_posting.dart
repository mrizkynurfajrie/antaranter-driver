import 'dart:developer';

import 'package:antaranter_driverapp/features/posting/customer_posting/api_customer_posting.dart';
import 'package:antaranter_driverapp/response/nebeng_customer_response.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_item_filter.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerCustomerPosting extends GetxController {
  final ApiCustomerPosting api;
  ControllerCustomerPosting({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final listCustomerNebeng = List<NebengCustomerResponse>.empty().obs;

  var loading = false.obs;
  var loadingList = false.obs;

  late TextEditingController txtDateDeptStart;
  late TextEditingController txtDateDeptEnd;

  var selectedCityDept = 'Pilih kota keberangkatan'.obs;
  var selectedCityArv = 'Pilih kota tujuan'.obs;

  var cities = <ModelBottomsheet>[].obs;
  var search = ''.obs;

  final now = DateTime.now();

  var initDateEnd = DateTime.now().obs;

  @override
  void onInit() {
    txtDateDeptStart = TextEditingController();
    txtDateDeptEnd = TextEditingController();
    getData();
    getCities();
    super.onInit();
  }

  @override
  void dispose() {
    txtDateDeptStart.dispose();
    txtDateDeptEnd.dispose();
    super.dispose();
  }

  void getData() async {
    loading.value = loadingList.value = true;
    listCustomerNebeng.clear();
    resetFilter();
    try {
      var res =
          await api.listCustNebeng(id: controllerRiderInfo.rider.value.id!);
      if (res['success'] == true) {
        var data = res['data'];
        var resultNebeng = (data as List)
            .map((data) => NebengCustomerResponse.fromJson(data))
            .toList();
        if (resultNebeng.isNotEmpty) {
          resultNebeng = resultNebeng
              .where((nebeng) =>
                  dateTimeBetween(nebeng.dateDep!, "00:00:00", DateTime.now().subtract(Duration(days: 1)),
                      "${DateTime.now().hour}:${DateTime.now().minute}:00") <
                  0)
              .toList();
          listCustomerNebeng.addAll(resultNebeng);
          loading.value = loadingList.value = false;
          log("list datetime : " + listCustomerNebeng.toString());
        } else {
          loading.value = loadingList.value = false;
        }
      } else {
        throw "Something error";
      }
    } catch (e) {
      loading.value = loadingList.value = false;
      log(e.toString());
      showPopUpError(errorMessage: e.toString(), errorTitle: 'Failed');
    }
  }

  getCities() async {
    try {
      cities.clear();
      var r = await api.cities(id: controllerRiderInfo.region.value.id!);
      for (var x in r['data']) {
        cities.add(ModelBottomsheet(
          itemName: x['name'],
          widget: CardItemFilter(
            data: x,
          ),
          value: x['id'],
        ));
        cities.sort((a, b) => a.itemName.compareTo(b.itemName));
      }
    } catch (e) {
      loading.value = loadingList.value = false;
      log(e.toString());
      // change(null, status: RxStatus.error(e.toString()));
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
    }
  }

  buildCitiesDep(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
       
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search.value = '';
            // search(value);
            log(value.toString());
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          selectedCityDept.value = value;
        }).showSelection();
  }

  buildCitiesArv(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search.value = '';
            // search(value);
            log(value.toString());
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          selectedCityArv.value = value;
        }).showSelection();
  }

  void searchData() async {
    loadingList.value = true;
    listCustomerNebeng.clear();
    try {
      var res =
          await api.listCustNebeng(id: controllerRiderInfo.rider.value.id!);
      if (res['success'] == true) {
        var data = res['data'];
        var resultNebeng = (data as List)
            .map((data) => NebengCustomerResponse.fromJson(data))
            .toList();
        if (resultNebeng.isNotEmpty) {
          resultNebeng = resultNebeng
              .where((nebeng) =>
                  dateTimeBetween(nebeng.dateDep!, "00:00:00", DateTime.now(),
                      "${DateTime.now().hour}:${DateTime.now().minute}:00") <
                  0)
              .toList();
          var resultFilter = await filterData(resultNebeng);
          listCustomerNebeng.addAll(resultFilter);
          loadingList.value = false;
        } else {
          loadingList.value = false;
        }
      } else {
        throw "Something error";
      }
    } catch (e) {
      log(e.toString());
      loadingList.value = false;
      showPopUpError(errorMessage: e.toString(), errorTitle: 'Failed');
    }
  }

  Future<List<NebengCustomerResponse>> filterData(
      List<NebengCustomerResponse> data) async {
    var listFilterNebeng = List<NebengCustomerResponse>.empty();
    var isFilterLocation = false;
    try {
      if (selectedCityDept.value != 'Pilih kota keberangkatan' &&
          selectedCityArv.value != 'Pilih kota tujuan') {
        listFilterNebeng = data
            .where((nebeng) =>
                nebeng.cityOrigin == selectedCityDept.value &&
                nebeng.cityDestination == selectedCityArv.value)
            .toList();
        isFilterLocation = true;
      } else if (selectedCityDept.value != 'Pilih kota keberangkatan') {
        listFilterNebeng = data
            .where((nebeng) => nebeng.cityOrigin == selectedCityDept.value)
            .toList();
        isFilterLocation = true;
      } else if (selectedCityArv.value != 'Pilih kota tujuan') {
        listFilterNebeng = data
            .where((nebeng) => nebeng.cityDestination == selectedCityArv.value)
            .toList();
        isFilterLocation = true;
      }
      // print(txtDateDeptEnd.text.isNotEmpty);
      var dateStart = txtDateDeptStart.text.isNotEmpty
          // ? LocaleTime.stringDateToDateTime(txtDateDeptStart.text)
          ? FormatDateTime.stringDateToDateTime(txtDateDeptStart.text)
          : DateTime.now();
      var dateEnd = txtDateDeptEnd.text.isNotEmpty
          ? FormatDateTime.stringDateToDateTime(txtDateDeptEnd.text)
          // .add(const Duration(days: 1))
          : FormatDateTime.stringDateToDateTime("9999-12-30");
      var timeStart = dateStart ==
              FormatDateTime.stringDateToDateTime(DateTime.now().toString())
          ? "${DateTime.now().hour}:${DateTime.now().minute}:00"
          : "00:00:00";
      var timeEnd = "23:59:00";

      if (isFilterLocation) {
        listFilterNebeng = listFilterNebeng
            .where((nebeng) =>
                dateTimeBetween(
                        nebeng.dateDep!, "00:00:00", dateStart, timeStart) <=
                    0 &&
                dateTimeBetween(
                        nebeng.dateDep!, "00:00:00", dateEnd, timeEnd) >=
                    0)
            .toList();
      } else {
        listFilterNebeng = data.where((nebeng) {
          // print(
          //     "ID ${nebeng.id} ${nebeng.dateDep!.toUtc().compareTo(dateStart.toUtc())} ${nebeng.dateDep!.compareTo(dateEnd)}");
          // print(
          //     "ID ${nebeng.id} ${daysBetween(nebeng.dateDep!, dateStart)} ${daysBetween(nebeng.dateDep!, dateEnd)}");
          return dateTimeBetween(
                      nebeng.dateDep!, "00:00:00", dateStart, timeStart) <=
                  0 &&
              dateTimeBetween(nebeng.dateDep!, "00:00:00", dateEnd, timeEnd) >=
                  0;
        }).toList();
      }
    } catch (e) {
      log(e.toString());
      loadingList.value = false;
      showPopUpError(errorMessage: e.toString(), errorTitle: "Failed");
    }

    return listFilterNebeng;
  }

  void resetFilter() {
    selectedCityDept.value = 'Pilih kota keberangkatan';
    selectedCityArv.value = 'Pilih kota tujuan';
    txtDateDeptStart.text = '';
    txtDateDeptEnd.text = '';
  }

  int dateTimeBetween(
      DateTime fromDate, String fromTime, DateTime toDate, String toTime) {
    var splitFromTime = fromTime.split(':');
    var splitToTime = toTime.split(':');

    fromDate = DateTime(fromDate.year, fromDate.month, fromDate.day,
        int.parse(splitFromTime[0]));
    toDate = DateTime(
        toDate.year, toDate.month, toDate.day, int.parse(splitToTime[0]));
    return (toDate.difference(fromDate).inSeconds / 60).round();
  }

  Future<void> onRefresh() async {
    loading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    getData();
  }
}
