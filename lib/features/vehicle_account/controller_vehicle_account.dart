import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_rider/features/vehicle_account/api_vehicle_account.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/nebeng_rider.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';
import 'package:intake_rider/shared/helpers/format_date_time.dart';

class ControllerVehicleAccount extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();

  final ApiVehicleAccount api;
  ControllerVehicleAccount({required this.api});

  var txtSimNum = TextEditingController();
  var txtSimExp = TextEditingController();
  var txtPlatNum = TextEditingController();
  var txtVehicleVar = TextEditingController();
  var txtVehicleCol = TextEditingController();

  final simNum = ''.obs;
  final simExp = ''.obs;
  final imgSim = ''.obs;
  final platNum = ''.obs;
  final vehicleVar = ''.obs;
  final vehicleCol = ''.obs;
  final imgStnk = ''.obs;

  var idNebengRider = 0.obs;
  var simPreview = ''.obs;
  var stnkPreview = ''.obs;
  var idRider = 0.obs;
  var uploadSim = '';
  var uploadStnk = '';
  var loading = false.obs;

  final ImagePicker picker = ImagePicker();

  @override
  void onInit() async {
    var rider = await Api2().getRider();
    log('data rider : ' + rider.toString());
    idRider.value = rider["id"] ?? 0;

    await getVehicleData();

    txtSimNum.text = controllerVehicleInfo.vehicle.value.sim ?? '';
    txtSimExp.text = controllerVehicleInfo.vehicle.value.simExp == null
        ? ''
        : FormatDateTime.formatDateWithoutHour(
            value: controllerVehicleInfo.vehicle.value.simExp!);
    txtPlatNum.text = controllerVehicleInfo.vehicle.value.platNumber ?? '';
    txtVehicleCol.text = controllerVehicleInfo.vehicle.value.vehicleColor ?? '';
    txtVehicleVar.text =
        controllerVehicleInfo.vehicle.value.vehicleVariant ?? '';
    super.onInit();
  }

  getVehicleData() async {
    try {
      var responData = await api.updateNebengRider(
          riderId: controllerRiderInfo.rider.value.id);
      idNebengRider.value = responData['data']['nebeng_rider']['id'];
      controllerVehicleInfo.vehicle.value =
          NebengRider.fromJson(responData['data']['nebeng_rider']);
      return responData;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    txtSimNum.dispose();
    txtSimExp.dispose();
    txtPlatNum.dispose();
    txtVehicleVar.dispose();
    txtVehicleCol.dispose();
  }

// sim //
  getSimFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    simPreview.value = camImage!.path;
  }

  getSimFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    simPreview.value = fileImage!.path;
  }

  simSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getSimFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getSimFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

// stnk //
  getStnkFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    stnkPreview.value = camImage!.path;
  }

  getStnkFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    stnkPreview.value = fileImage!.path;
  }

  stnkSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: SizedBox(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getStnkFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getStnkFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  uploadSimPict() async {
    try {
      var uploadSelSim = await api.uploadSimImg(simImg: simPreview.value);
      if (uploadSelSim != null) {
        var selfSimValue = uploadSelSim["data"]["filename"];
        uploadSim = selfSimValue;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  uploadStnkPict() async {
    try {
      var uploadSelStnk = await api.uploadStnkImg(stnkImg: stnkPreview.value);
      if (uploadSelStnk != null) {
        var selfStnkValue = uploadSelStnk["data"]["filename"];
        uploadStnk = selfStnkValue;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  updateVehicleAccount() async {
    try {
      loading.value = true;
      await uploadSimPict();
      await uploadStnkPict();
      var updateResult = await api.updateVehicleAccount(
          simNum: txtSimNum.text,
          simExp: txtSimExp.text,
          simPict: uploadSim,
          platNum: txtPlatNum.text,
          vehicleVar: txtVehicleVar.text,
          vehicleCol: txtVehicleCol.text,
          stnkPict: uploadStnk,
          idRiderNebeng: idNebengRider.value,
          idRider: idRider.value);
      log(updateResult.toString());
      if (updateResult['success'] == true) {
        var result = updateResult["data"];
        await Api2().setVehicle(vehicle: result);
        var vehicle = NebengRider.fromJson(result);
        Get.find<ControllerVehicleInfo>().vehicle.value = vehicle;
        Get.snackbar(
          'Perbarui Profil Kendaraan ',
          'Profil Kendaraan anda berhasil diperbarui',
          snackPosition: SnackPosition.BOTTOM,
        );
      }else{
        throw "Gagal memperbarui akun";
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }
}
