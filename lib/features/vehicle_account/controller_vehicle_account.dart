import 'dart:developer';
import 'dart:io';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:antaranter_driverapp/features/vehicle_account/api_vehicle_account.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/nebeng_rider.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
  var statusUpdate = 0.obs;

  final ImagePicker picker = ImagePicker();

  var maskFormatter = MaskTextInputFormatter(
    mask: '##-####-###',
    filter: {"#": RegExp(r'[A-Z][0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void onInit() async {
    var rider = await Api2().getRider();
    log('data rider : ' + rider.toString());
    idRider.value = rider["id"] ?? 0;

    await getVehicleData();

    txtSimNum.text = controllerVehicleInfo.vehicle.value.sim ?? '';
    txtSimExp.text = controllerVehicleInfo.vehicle.value.simExp == null
        ? ''
        : FormatDateTime.formatDateWithoutHouryyyy(
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
  Future<File> compressImage(XFile image) async {
    final dir = await path_provider.getTemporaryDirectory();
    var targetPath = dir.absolute.path +
        "/temp-${DateTime.now().millisecondsSinceEpoch}.png";
    var compressFile = await FlutterImageCompress.compressAndGetFile(
      image.path,
      targetPath,
      quality: 70,
      format: CompressFormat.png,
    );
    return compressFile!;
  }

  getSimFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      var result = await compressImage(camImage);
      simPreview.value = result.path;
    }
  }

  getSimFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      simPreview.value = result.path;
    }
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
    if (camImage != null) {
      var result = await compressImage(camImage);
      stnkPreview.value =  result.path;
    }
  }

  getStnkFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      stnkPreview.value = result.path;
    }
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
        var selfSimValue = uploadSelSim["data"]["key"];
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
        var selfStnkValue = uploadSelStnk["data"]["key"];
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
      if (uploadSim == '') {
        if (controllerVehicleInfo.vehicle.value.simPict != null) {
          uploadSim = controllerVehicleInfo.vehicle.value.simPict!;
        }
      }
      if (uploadStnk == '') {
        if (controllerVehicleInfo.vehicle.value.stnkPict != null) {
          uploadStnk = controllerVehicleInfo.vehicle.value.stnkPict!;
        }
      }

      var updateResult = await api.updateVehicleAccount(
        simNum: txtSimNum.text,
        simExp: txtSimExp.text,
        simPict: uploadSim,
        platNum: txtPlatNum.text,
        vehicleVar: txtVehicleVar.text,
        vehicleCol: txtVehicleCol.text,
        stnkPict: uploadStnk,
        idRiderNebeng: idNebengRider.value,
        idRider: idRider.value,
      );

      log(updateResult.toString());
      if (updateResult['success'] == true) {
        var result = updateResult["data"];
        await Api2().setVehicle(vehicle: result);
        var vehicle = NebengRider.fromJson(result);
        Get.find<ControllerVehicleInfo>().vehicle.value = vehicle;
        showPopUp(
          title: 'Perbarui Profil Kendaraan',
          description: 'Profil Kendaraan anda berhasil diperbarui',
          imageUri: PopUpIcons.success,
        );
        await Future.delayed(const Duration(seconds: 3));
        Get.offAllNamed(Routes.main, arguments: 2);
      } else {
        throw "Gagal memperbarui akun";
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
      showPopUpError(
        errorTitle: 'Terjadi Kesalahan',
        errorMessage: e.toString(),
      );
    }
  }
}
