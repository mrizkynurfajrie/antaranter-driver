import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/nebeng_posting/api_nebeng_posting.dart';
import 'package:intake_rider/response/nebeng_rider.dart';
import 'package:intake_rider/response/post.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';
import 'package:intake_rider/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:intake_rider/shared/widgets/cards/card_item.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ControllerNebengPosting extends GetxController {
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiNebengPosting api;
  ControllerNebengPosting({required this.api});

  var txtSeatAvail = TextEditingController();
  var txtPrice = TextEditingController();
  var txtDateDept = TextEditingController();
  var txtDateArrv = TextEditingController();
  var txtTimeDept = TextEditingController();
  var txtTimeArrv = TextEditingController();
  var itemProvinceDept = 'Provinsi'.obs;
  var itemCitiesDept = 'Kota'.obs;
  var itemProvinceArrv = 'Provinsi'.obs;
  var itemCitiesArrv = 'Kota'.obs;

  List dropDownList = ['1', '2', '3', '4', '5'];

  var dropDownValue = '1'.obs;
  var search = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;
  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;
  var idRider = 0.obs;
  var idNebengRider = 0.obs;
  var loading = false;

  var maskFormatter = MaskTextInputFormatter(
    mask: '###.###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void onInit() async {
    await getVehicle();
    await getProvinces();

    super.onInit();
  }

  getVehicle() async {
    try {
      var r =
          await api.getVehicleInfo(riderId: controllerRiderInfo.rider.value.id);
      log('data r' + r.toString());
      idNebengRider.value = r["data"]["nebeng_rider"]["id"];
      controllerVehicleInfo.vehicle.value =
          NebengRider.fromJson(r["data"]["nebeng_rider"]);
      return r;
    } catch (e) {
      log(e.toString());
    }
  }

  getProvinces() async {
    try {
      var r = await api.getProvince();

      for (var x in r['data']) {
        provinces.add(
          ModelBottomsheet(
              itemName: x['name'],
              widget: CardItem(
                data: x,
              ),
              value: x['id']),
        );
        provinces.sort((a, b) => a.itemName.compareTo(b.itemName));
      }
    } catch (_) {}
  }

  getCities() async {
    try {
      cities.clear();
      var r = await api.getCity(idProvince: idProvince.value);
      for (var x in r['data']) {
        cities.add(ModelBottomsheet(
          itemName: x['name'],
          widget: CardItem(
            data: x,
          ),
          value: x['id'],
        ));
        cities.sort((a, b) => a.itemName.compareTo(b.itemName));
      }
    } catch (_) {}
  }

  buildProvince(context) {
    BottomsheetSelection(
        title: 'Pilih Provinsi',
        context: context,
        listWidget: provinces,
        value: (value) async {
          if (value != null) {
            search('');
            idProvince(value);
            await getCities();
          }
        },
        itemName: (value) {
          itemProvinceDept(value);
        }).showSelection();
  }

  buildCities(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search('');
            idCities(value);
            search(value);
          }
        },
        itemName: (value) {
          itemCitiesDept(value);
        }).showSelection();
  }

  buildProvinceArrv(context) {
    BottomsheetSelection(
        title: 'Pilih Provinsi',
        context: context,
        listWidget: provinces,
        value: (value) async {
          if (value != null) {
            search('');
            idProvince(value);
            await getCities();
          }
        },
        itemName: (value) {
          itemProvinceArrv(value);
        }).showSelection();
  }

  buildCitiesArrv(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search('');
            log(value.toString());
            idCities(value);
            search(value);
          }
        },
        itemName: (value) {
          itemCitiesArrv(value);
        }).showSelection();
  }

  createNebengPosting() async {
    try {
      loading = true;
      var priceformatted = maskFormatter.getUnmaskedText();
      var updateResult = await api.postingNebeng(
        idRider: controllerRiderInfo.rider.value.id,
        cityOrigin: itemCitiesDept.value,
        cityDestination: itemCitiesArrv.value,
        dateDep: txtDateDept.text,
        dateArr: txtDateArrv.text,
        timeDep: txtTimeDept.text,
        timeArr: txtTimeArrv.text,
        seatAvail: dropDownValue.value,
        price: priceformatted,
      );
      log('hasil data : ' + updateResult.toString());
      if (updateResult['success'] == true) {
        controllerRiderInfo.setRiderHasActivePost(true);
        var result = updateResult["data"];
        var postResponse = Post.fromJson(result);
        controllerRiderInfo.setActivePost(postResponse.id!);
        
        Get.snackbar(
          "Nebeng",
          "Anda telah berhasil membagikan perjalanan anda",
          snackPosition: SnackPosition.BOTTOM,
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed(Routes.main, arguments: 1);
      }
      loading = false;
    } catch (e) {
      loading = false;
      log(e.toString());
    }
  }
}
