import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/nebeng_posting/api_nebeng_posting.dart';
import 'package:antaranter_driverapp/response/nebeng_rider.dart';
import 'package:antaranter_driverapp/response/post.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_item.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ControllerNebengPosting extends GetxController {
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiNebengPosting api;
  ControllerNebengPosting({required this.api});

  List dropDownList = ['1', '2', '3', '4', '5'];

  var txtSeatAvail = TextEditingController();
  var txtPrice = TextEditingController();
  var txtDateDept = TextEditingController();
  var txtDateArrv = TextEditingController();
  var txtTimeDept = TextEditingController();
  var txtTimeArrv = TextEditingController();
  var isValidForm = false.obs;
  var isValidPrice = false.obs;
  var itemProvinceDept = 'Provinsi'.obs;
  var itemCitiesDept = 'Kota'.obs;
  var itemProvinceArrv = 'Provinsi'.obs;
  var itemCitiesArrv = 'Kota'.obs;
  var dropDownValue = '1'.obs;
  var search = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;
  var idRider = 0.obs;
  var idNebengRider = 0.obs;
  var statusNebeng = 0.obs;
  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;
  var loading = false;

  var maskFormatter = MaskTextInputFormatter(
    mask: '##.####' '###.###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void onInit() async {
    formValidationListener();
    await getVehicle();
    await getProvinces();

    super.onInit();
  }

  @override
  onClose() {
    super.onClose();
    txtPrice.dispose();
  }

  formValidationListener() {
    txtPrice.addListener(() {
      isValidPrice.value = txtPrice.text.isNotEmpty;
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = isValidPrice.value;
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
      var priceformatted = txtPrice.text.replaceAll(RegExp('[^A-Za-z0-9]'), '');
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
      } else {
        Get.snackbar(
          "Gagal Membagikan Perjalanan",
          "Anda sedang memiliki pesanan aktif",
          snackPosition: SnackPosition.BOTTOM,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.offAllNamed(Routes.main);
      }
      loading = false;
    } catch (e) {
      loading = false;
      log(e.toString());
    }
  }
}
