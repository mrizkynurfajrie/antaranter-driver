import 'dart:developer';
import 'dart:io';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:antaranter_driverapp/features/user_account/api_user_account.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/main_rider.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/helpers/format_date_time.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_item_profile.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ControllerUserAccount extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiUserAccount api;
  ControllerUserAccount({required this.api});

  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtGender = TextEditingController();
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
  var statusUpdate = 0.obs;
  var itemProvince = 'Provinsi'.obs;
  var itemCities = ''.obs;
  var itemGender = 'Jenis Kelamin'.obs;
  var search = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;
  var gender = ''.obs;
  var selectedGender = ''.obs;
  var selectedCities = ''.obs;
  var selectedProvince = ''.obs;
  var indexProv = 0.obs;
  var indexCities = 0.obs;

  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;

  final ImagePicker picker = ImagePicker();
  // XFile? img;

  @override
  void onInit() async {
    // await getRiderData();
    await getProvinces();
    var rider = await Api2().getRider();
    idRider.value = rider["id"] ?? 0;

    // await getRiderData();

    txtName.text = controllerRiderInfo.rider.value.name ?? '';
    txtEmail.text = controllerRiderInfo.rider.value.email ?? '';
    selectedGender.value = controllerRiderInfo.rider.value.gender ?? '';
    txtNik.text = controllerRiderInfo.rider.value.nik ?? '';
    txtDate.text = controllerRiderInfo.rider.value.birth == null
        ? ''
        : FormatDateTime.formatDateWithoutHouryyyy(
            value: controllerRiderInfo.rider.value.birth!);
    txtAddress.text = controllerRiderInfo.rider.value.address ?? '';
    txtPhone.text = controllerRiderInfo.rider.value.phone ?? '';
    itemCities.value =
        controllerRiderInfo.rider.value.cityLocation ?? itemCities.value;
    txtCity.text =
        controllerRiderInfo.rider.value.cityLocation ?? itemCities.value;
    // controllerRiderInfo.rider.value.status = 1;
    statusUpdate.value = controllerRiderInfo.rider.value.status!;

    if (controllerRiderInfo.rider.value.gender == 'male') {
      gender.value = 'Laki-Laki';
    } else {
      gender.value = 'Perempuan';
    }

    await getProvinces();

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

  // getRiderData() async {
  //   try {
  //     var responData = await api.updateUserAccount(
  //       idRider: controllerRiderInfo.rider.value.id,
  //       name: controllerRiderInfo.rider.value.name,
  //       img: controllerRiderInfo.rider.value.image,
  //       email: controllerRiderInfo.rider.value.email,
  //       nik: controllerRiderInfo.rider.value.nik,
  //       ktp: controllerRiderInfo.rider.value.ktpPict,
  //       phone: controllerRiderInfo.rider.value.phone,
  //       birth: controllerRiderInfo.rider.value.birth,
  //       address: controllerRiderInfo.rider.value.address,
  //       city: controllerRiderInfo.rider.value.cityLocation,
  //     );

  //     controllerRiderInfo.rider.value = MainRider.fromJson(responData['data']);
  //     return responData;
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

//KTP//
  Future<File> compressImage(XFile image) async {
    final dir = await path_provider.getTemporaryDirectory();
    var targetPath = "${dir.absolute.path}/temp-${DateTime.now().millisecondsSinceEpoch}.png";
    var compressFile = await FlutterImageCompress.compressAndGetFile(
      image.path,
      targetPath,
      quality: 70,
      format: CompressFormat.png,
    );
    return compressFile!;
  }

  getKtpFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      // var result = await compressImage(camImage);
      ktpPreview.value = camImage.path;
    }
  }

  getKtpFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      // var result = await compressImage(fileImage);
      ktpPreview.value = fileImage.path;
    }
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

  //foto profil//
  getFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      // var result = await compressImage(camImage);
      imgPreview.value = camImage.path;
    }
  }

  getFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      // var result = await compressImage(fileImage);
      imgPreview.value = fileImage.path;
    }
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
        var selfImgValue = uploadSelImg["data"]["key"];
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
        var selfKtpValue = uploadSelKtp["data"]["key"];
        uploadKtp = selfKtpValue;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getProvinces() async {
    try {
      provinces.clear();
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

  buildGender() {
    return Get.defaultDialog(
      title: 'Pilih Jenis Kelamin',
      titlePadding: EdgeInsets.symmetric(vertical: 15.h),
      titleStyle: TextStyles.inter.copyWith(
        fontSize: FontSizes.s14,
        fontWeight: FontWeight.w500,
        color: AppColor.primaryColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      content: CardRounded(
        color: AppColor.whiteColor,
        width: Get.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: () {
                gender.value = 'Laki-Laki';
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColor.greyColorLight, width: 1))),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.comfortable,
                  trailing: Icon(
                    Icons.male,
                    size: IconSizes.med,
                    color: AppColor.genderMale,
                  ),
                  title: Text(
                    'Laki-Laki',
                    style: TextStyles.body1,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                gender.value = 'Perempuan';
                Get.back();
              },
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColor.greyColorLight, width: 1))),
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.comfortable,
                  trailing: Icon(
                    Icons.female,
                    size: IconSizes.med,
                    color: AppColor.genderFemale,
                  ),
                  title: Text(
                    'Perempuan',
                    style: TextStyles.body1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
            getCities();
            Navigator.pop(context);
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
            Navigator.pop(context);
          } else {}
        },
        itemName: (value) {
          itemCities(value);
        }).showSelection();
  }

  dialogUbahProfil() {
    return Get.defaultDialog(
        title: 'Ubah Profil Pengguna',
        barrierDismissible: false,
        titleStyle: TextStyles.inter.copyWith(
            color: AppColor.primaryColor, fontWeight: FontWeight.w500),
        titlePadding: EdgeInsets.only(bottom: 10.h, top: 20.h),
        backgroundColor: AppColor.whiteColor,
        radius: 10,
        content: CardRounded(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.med.w, vertical: Insets.med.h),
          child: Text(
            "Apakah anda yakin ingin merubah profil pengguna anda? Karena setelah anda berhasil mengubah profil pengguna anda, maka status aplikasi anda akan kembali menunggu verifikasi admin selama 1x24 jam",
            style: TextStyles.inter
                .copyWith(fontSize: FontSizes.s14, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
        confirm: ButtonPrimary(
          onPressed: () async {
            await updateUserAccount();
            showPopUp(
              title: 'Berhasil',
              description: 'Data profil pengguna berhasil diubah',
              imageUri: PopUpIcons.success,
            );
            await Future.delayed(const Duration(seconds: 3));
            Get.back();
            Get.offAllNamed(Routes.main);
          },
          label: 'Iya',
          cornerRadius: 4,
          size: 300.w,
          height: Get.height * 0.06.h,
          labelStyle: TextStyles.inter.copyWith(color: AppColor.whiteColor),
        ),
        cancel: ButtonPrimary(
          onPressed: () {
            Get.back();
          },
          label: 'Kembali',
          cornerRadius: 4,
          size: 300.w,
          height: Get.height * 0.06.h,
          color: AppColor.whiteColor,
          labelStyle: TextStyles.inter.copyWith(color: AppColor.errorColor),
          borderColor: AppColor.errorColor,
        ));
  }

  dialogProfilKendaraan() {
    return Get.defaultDialog(
      title: "Profil Pengguna & Kendaraan",
      barrierDismissible: false,
      titleStyle: TextStyles.inter
          .copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.only(bottom: 10.h, top: 20.h),
      backgroundColor: AppColor.whiteColor,
      radius: 10,
      content: CardRounded(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.med.w, vertical: Insets.med.h),
        child: Text(
          "Apakah anda ingin perbarui profil kendaraan anda juga?",
          style: TextStyles.inter
              .copyWith(fontSize: FontSizes.s14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.justify,
        ),
      ),
      confirm: ButtonPrimary(
        onPressed: () {
          Get.toNamed(Routes.vehicleAccount);
        },
        label: 'Ya',
        cornerRadius: 4,
        size: 300,
        height: Get.height * 0.06.h,
        labelStyle: TextStyles.inter.copyWith(color: AppColor.whiteColor),
      ),
      cancel: ButtonPrimary(
        onPressed: () {
          Get.offNamed(Routes.profile);
        },
        label: 'Kembali',
        cornerRadius: 4,
        size: 300,
        height: Get.height * 0.06.h,
        color: AppColor.whiteColor,
        labelStyle: TextStyles.inter.copyWith(color: AppColor.errorColor),
        borderColor: AppColor.errorColor,
      ),
    );
  }

  updateUserAccount() async {
    loadingForm.value = true;
    var hasilstatus = controllerRiderInfo.rider.value.status == 0 ||
            controllerRiderInfo.rider.value.status == 2
        ? controllerRiderInfo.rider.value.status = 1
        : controllerRiderInfo.rider.value.status = 1;
    try {
      await uploadImgRider();
      await uploadKtpRider();
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
      if (gender.value == 'Laki-Laki') {
        selectedGender.value = 'male';
      } else {
        selectedGender.value = 'female';
      }
      var updateResult = await api.updateUserAccount(
        name: txtName.text,
        email: txtEmail.text,
        gender: selectedGender.value,
        nik: txtNik.text,
        ktp: uploadKtp,
        img: uploadImg,
        birth: txtDate.text,
        address: txtAddress.text,
        phone: txtPhone.text,
        city: itemCities.value,
        idRider: idRider.value,
        // status: statusUpdate.value,
        status: hasilstatus,
      );
      log(updateResult.toString());
      if (updateResult['success'] == true) {
        var result = updateResult["data"];
        await Api2().setRider(rider: result);
        var rider = MainRider.fromJson(result);
        Get.find<ControllerRiderInfo>().rider.value = rider;
      } else {
        throw "Gagal memperbarui akun";
      }
      loadingForm.value = false;
    } catch (e) {
      loadingForm.value = false;
      log(e.toString());
      showPopUpError(
          errorTitle: 'Terjadi kesalahan', errorMessage: e.toString());
    }
  }
}
