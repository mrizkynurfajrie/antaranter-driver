import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_rider/features/user_account/api_user_account.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/rider.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';

class ControllerUserAccount extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiUserAccount api;
  ControllerUserAccount({required this.api});

  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtDate = TextEditingController();
  var txtAddress = TextEditingController();
  var txtPhone = TextEditingController();
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

  final ImagePicker picker = ImagePicker();
  XFile? img;

  @override
  void onInit() async {
    var rider = await Api2().getRider();
    image.value = rider['image'] ?? '';
    name.value = rider['name'] ?? '';
    phone.value = rider['phone'] ?? '';
    email.value = rider['email'] ?? '';
    nik.value = rider['nik'] ?? '';
    city.value = rider['cityLocation'] ?? '';
    date.value = rider['birth'] ?? '';
    address.value = rider['address'] ?? '';
    idRider.value = rider['id'] ?? 0;
    ktpImage.value = rider['ktp_pict'] ?? '';

    txtName.text = name.value;
    txtEmail.text = email.value;
    txtNik.text = nik.value;
    txtDate.text = date.value;
    txtAddress.text = address.value;
    txtPhone.text = phone.value;
    txtCity.text = city.value;

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
