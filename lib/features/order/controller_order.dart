import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:intake_rider/shared/widgets/cards/card_item.dart';
import 'api_order.dart';

class ControllerOrder extends GetxController {
  final ApiOrder api;
  ControllerOrder({required this.api});

  List dropDownList = ['1', '2', '3', '4', '5'];
  var dropDownValue = '1'.obs;
  var ctrlDateDept = TextEditingController();
  var ctrlTimeDept = TextEditingController();
  var ctrlDateArrv = TextEditingController();
  var ctrlTimeArrv = TextEditingController();
  var ctrlProvince = TextEditingController().obs;
  var ctrlCities = TextEditingController().obs;

  var itemProvince = ''.obs;
  var itemCities = ''.obs;
  var search = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;

  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;

  @override
  onInit() {
    super.onInit();
    getProvinces();
  }

  getProvinces() async {
    try {
      // log("datanye");

      var r = await api.getProvince();
      // print("datanye" + r.toString());

      for (var x in r['data']) {
        // log(x.toString());
        provinces.add(
          ModelBottomsheet(
              itemName: x['name'],
              widget: CardItem(
                data: x,
              ),
              value: x['id']),
        );
        provinces.sort((a, b) => a.itemName.compareTo(b.itemName));
        log('isi province :' + provinces.toString());
      }
    } catch (_) {}
  }

  getCities() async {
    try {
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
            log(value.toString());
            idProvince(value);
            search(value);
            getCities();
          }
        },
        itemName: (value) {
          itemProvince(value);
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
            log(value.toString());
            idCities(value);
            search(value);
            getCities();
          }
        },
        itemName: (value) {
          itemCities(value);
        }).showSelection();
  }
}
