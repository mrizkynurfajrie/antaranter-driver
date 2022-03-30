import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_rider/features/user_account/api_user_account.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/rider.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/helpers/format_date_time.dart';
import 'package:intake_rider/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:intake_rider/shared/widgets/cards/card_item_profile.dart';

class ControllerUserAccount extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiUserAccount api;
  ControllerUserAccount({required this.api});

  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtDate = TextEditingController();
  var txtAddress = TextEditingController();
  var txtPhone = TextEditingController();
  var txtProvince = TextEditingController();
  var txtCity = TextEditingController();
  var txtNik = TextEditingController();

  final name = ''.obs;
  final phone = ''.obs;
  final email = ''.obs;
  final nik = ''.obs;
  final city = ''.obs;
  final date = ''.obs;
  final address = ''.obs;
  var idRider = 0.obs;
  var ktpPreview = ''.obs;
  var imgPreview = ''.obs;
  var uploadImg = '';
  var uploadKtp = '';
  var loading = false;
  var image = ''.obs;
  var ktpImage = ''.obs;
  var isValidProvince = false.obs;
  var isValidForm = false.obs;
  var loadingForm = false.obs;

  var itemProvince = 'Provinsi'.obs;
  var itemCities = 'Kota'.obs;
  var search = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;

  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;

  final ImagePicker picker = ImagePicker();
  XFile? img;

  @override
  void onInit() async {
    await getRiderData();
    await getProvinces();

    txtName.text = controllerRiderInfo.rider.value.name ?? '';
    txtEmail.text = controllerRiderInfo.rider.value.email ?? '';
    txtNik.text = controllerRiderInfo.rider.value.nik ?? '';
    txtDate.text = controllerRiderInfo.rider.value.birth == null
        ? ''
        : FormatDateTime.formatDateWithoutHour(
            value: controllerRiderInfo.rider.value.birth!);
    txtAddress.text = controllerRiderInfo.rider.value.address ?? '';
    txtPhone.text = controllerRiderInfo.rider.value.phone ?? '';
    txtCity.text = controllerRiderInfo.rider.value.cityLocation ?? '';

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    txtName.dispose();
    txtEmail.dispose();
    txtDate.dispose();
    txtAddress.dispose();
    txtPhone.dispose();
    txtCity.dispose();
  }

  // formValidationListener() {
  //   provinces.addListener(() {
  //     isValidProvince.value = itemProvince.isNotEmpty;
  //     validateForm();
  //   });
  // }

  // validateForm() {
  //   isValidForm.value = isValidProvince.value;
  // }

  getRiderData() async {
    try {
      var responData = await api.updateUserAccount(
        idRider: controllerRiderInfo.rider.value.id,
        name: controllerRiderInfo.rider.value.name,
        img: controllerRiderInfo.rider.value.image,
        email: controllerRiderInfo.rider.value.email,
        nik: controllerRiderInfo.rider.value.nik,
        ktp: controllerRiderInfo.rider.value.ktpPict,
        phone: controllerRiderInfo.rider.value.phone,
        birth: controllerRiderInfo.rider.value.birth,
        address: controllerRiderInfo.rider.value.address,
        city: controllerRiderInfo.rider.value.cityLocation,
      );

      controllerRiderInfo.rider.value = Rider.fromJson(responData['data']);
      return responData;
    } catch (e) {
      log(e.toString());
    }
  }

//KTP//
  getKtpFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    ktpPreview.value = camImage!.path;
  }

  getKtpFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    ktpPreview.value = fileImage!.path;
  }

  ktpSourceSelector(context) {
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
                      getKtpFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getKtpFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  getFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    imgPreview.value = camImage!.path;
    img = camImage;
  }

  getFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    imgPreview.value = fileImage!.path;
  }

  imgSourceSelector(context) {
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
                      getFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  uploadImgRider() async {
    try {
      var uploadSelImg =
          await api.uploadProfileImg(profileImg: imgPreview.value);
      if (uploadSelImg != null) {
        var selfImgValue = uploadSelImg["data"]["filename"];
        uploadImg = selfImgValue;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  uploadKtpRider() async {
    try {
      var uploadSelKtp = await api.uploadKtpImg(ktpImg: ktpPreview.value);
      if (uploadSelKtp != null) {
        var selfKtpValue = uploadSelKtp["data"]["filename"];
        uploadKtp = selfKtpValue;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getProvinces() async {
    try {
      var r = await api.getProvince();

      for (var x in r['data']) {
        // log(x.toString());
        provinces.add(
          ModelBottomsheet(
              itemName: x['name'],
              widget: CardItemProfile(
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
          widget: CardItemProfile(
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
            await getCities();
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
          }
        },
        itemName: (value) {
          itemCities(value);
        }).showSelection();
  }

  updateUserAccount() async {
    try {
      loading = true;
      if (uploadImg == '') {
        if (controllerRiderInfo.rider.value.image != null) {
          uploadImg = controllerRiderInfo.rider.value.image!;
        }
      }
      if (uploadKtp == '') {
        if (controllerRiderInfo.rider.value.ktpPict != null) {
          uploadKtp = controllerRiderInfo.rider.value.ktpPict!;
        }
      }
      var updateResult = await api.updateUserAccount(
        name: txtName.text,
        email: txtEmail.text,
        nik: txtNik.text,
        ktp: uploadKtp,
        img: uploadImg,
        birth: txtDate.text,
        address: txtAddress.text,
        phone: txtPhone.text,
        city: txtCity.text,
        idRider: idRider.value,
      );
      log(updateResult.toString());
      if (updateResult != null) {
        var result = updateResult["data"];
        await Api2().setRider(rider: result);
        var rider = Rider.fromJson(result);
        Get.find<ControllerRiderInfo>().rider.value = rider;
        Get.snackbar(
          'Update Profile Pengguna',
          'Akun Pengguna anda berhasil diperbarui',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      loading = false;
    } catch (e) {
      loading = false;
      log(e.toString());
    }
  }
}
