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

  var itemProvince = ''.obs;
  var search = ''.obs;

  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;

  getProvinces() async {
    try {
      var r = await api.getProvince();
      for (var x in r['message']) {
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

  getCity() async {
    try {
      var r = await api.getCity();
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
            ctrlProvince(value);
            search(value);
            getCity();
          }
        },
        itemName: (value) {
          itemProvince(value);
        }).showSelection();
  }
}
