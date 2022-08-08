import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:antaranter_driverapp/features/register/page/form_agreement.dart';
import 'package:antaranter_driverapp/features/register/page/form_register_data.dart';
import 'package:antaranter_driverapp/features/register/page/form_register_user.dart';
import 'package:antaranter_driverapp/features/register/page/form_register_vehicle.dart';
import 'package:antaranter_driverapp/response/agreement.dart';
import 'package:antaranter_driverapp/response/main_rider.dart';
import 'package:antaranter_driverapp/response/nebeng_rider.dart';
import 'package:antaranter_driverapp/response/term_condition.dart';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/controller/controller_agreement.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';
import 'package:antaranter_driverapp/shared/helpers/regex.dart';
import 'package:antaranter_driverapp/shared/widgets/bottomsheet/bottomsheet_selection.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_item_register.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/register/api_register.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/shared/helpers/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ControllerRegister extends GetxController {
  final ApiRegister api;
  ControllerRegister({required this.api});

  @override
  void onInit() async {
    pageController = PageController(initialPage: currentPage.value);
    await getProvinces();
    getDataTerm();
    formUserValidationListener();
    formDataValidationListener();
    formVehicleValidationListener();
    getDataAgreement();
    super.onInit();
  }

  @override
  onClose() {
    super.onClose();
    cPhoneNumber.dispose();
    cPassword.dispose();
    txtPic.dispose();
    txtName.dispose();
    txtDate.dispose();
    txtGender.dispose();
    txtEmail.dispose();
    txtNik.dispose();
    txtKtp.dispose();
    txtCity.dispose();
    txtAddress.dispose();
  }

  //Global Controller//
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerAgreement = Get.find<ControllerAgreementInfo>();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  var token = ''.obs;
  var loading = true.obs;
  var isRegistered = false.obs;

  //Auto Login Controller//
  var loginStatus = false;

  //Parent Page Controller//
  var currentPage = 0.obs;
  late PageController pageController;
  final List<Widget> pages = [
    const FormRegisterUser(),
    const FormRegisterData(),
    const FormRegisterVehicle(),
    const FormAgreement(),
  ];
  changePage(index) => currentPage.value = index;

  //Term Condition Controller
  var statusAgreementTerm = false.obs;
  var termCondition = TermCondition().obs;
  var status = 0.obs;

  getDataTerm() async {
    try {
      var res = await api.termNebeng();
      if (res["success"] == true) {
        termCondition.value = TermCondition.fromJson(res['data']);
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //Form Register User Controller//
  var cPhoneNumber = TextEditingController();
  var cPassword = TextEditingController();
  final checkboxForm = GlobalKey<FormState>();
  var validPhoneNumber = false.obs;
  var validPassword = false.obs;
  var validCheck = false.obs;
  var isValidFormUser = false.obs;
  var isCheck = false.obs;
  var statusNebeng = 0.obs;
  var idRider = 0.obs;
  bool isReady = false;
  var registered = false.obs;

  formUserValidationListener() {
    cPhoneNumber.addListener(() {
      validPhoneNumber.value =
          isValidPhoneNumber(phoneNumber: cPhoneNumber.text);
      validateFormUser();
    });
    cPassword.addListener(() {
      validPassword.value = isValidPassword(password: cPassword.text);
      validateFormUser();
    });
    txtName.addListener(() {
      validName.value = isValidName(name: txtName.text);
      validateFormData();
    });
  }

  validateFormUser() {
    isValidFormUser.value =
        validPhoneNumber.value && validPassword.value && validName.value;
  }

  register() async {
    dismisKeyboard();
    loading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      var res = await api.userRegister(
        name: txtName.text,
        password: cPassword.text,
        phone: cPhoneNumber.text,
      );

      if (res['success'] == true) {
        String? fcmToken = await messaging.getToken();
        var autoSignin = await api.autoLogin(
            phoneNumber: cPhoneNumber.text,
            password: cPassword.text,
            fcm: fcmToken ?? '00');
        loading.value = false;
        if (autoSignin['success'] == true) {
          var detailUser = autoSignin["data"]["rider"];
          await Api2().setRider(rider: detailUser);
          var getDetailUser = await Api2().getRider();
          controllerRiderInfo.rider.value = MainRider.fromJson(detailUser);
          log(getDetailUser.toString());
          var tokenUser = autoSignin["data"]["token"];
          token.value = tokenUser;
          await Api2().setToken(token: token.value);
          registered.value = true;
          loginStatus = true;
          await Api2().setIsLogin(isLogin: loginStatus);
          // Get.offAllNamed(Routes.regsuccess);
          // await Future.delayed(const Duration(seconds: 5));
          var riderId = res['data']['newRider']['id'];
          var resNebengRider = await api.createNebengRider(
            idRider: riderId,
          );
          var resAgreement = await api.createAgreement(
            idRider: riderId,
            status: status.value,
          );
          isRegistered.value = true;
          // Get.toNamed(Routes.main);
        }
      } else {
        var firstError = res['errors'][0];
        throw firstError['message'];
      }
    } catch (e) {
      loading.value = false;
      showPopUp(
          title: 'Terjadi Kesalahan',
          description:
              'Nomor ponsel sudah terdaftar, mohon gunakan nomor ponsel yang belum pernah terdaftar pada aplikasi AntarAnter',
          imageUri: PopUpIcons.error);
      await Future.delayed(const Duration(seconds: 3));
      Get.back();
    }
  }

  //Form Register Data//
  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtGender = TextEditingController();
  var txtDate = TextEditingController();
  var txtAddress = TextEditingController();
  var txtKtp = TextEditingController();
  var txtPhone = TextEditingController();
  var txtCity = TextEditingController();
  var txtNik = TextEditingController();
  var txtPic = TextEditingController();
  var gender = ''.obs;
  var genderActive = false.obs;
  var selectedGender = ''.obs;
  var imgPreview = ''.obs;
  var ktpPreview = ''.obs;
  var itemProvince = 'Provinsi'.obs;
  var itemCities = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;
  var search = ''.obs;
  var validImage = false.obs;
  var validName = false.obs;
  var validDate = false.obs;
  var validGender = false.obs;
  var validEmail = false.obs;
  var validNik = false.obs;
  var validKtp = false.obs;
  var validCity = false.obs;
  var validAddress = false.obs;
  var isValidFormData = false.obs;
  var uploadImg = '';
  var uploadKtp = '';
  var loadingForm = false.obs;
  var updateddata = false.obs;
  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;
  final ImagePicker picker = ImagePicker();

  formDataValidationListener() {
    txtPic.addListener(() {
      validImage.value = isValidNotEmpty(data: txtPic.text);
      validateFormData();
    });
    txtDate.addListener(() {
      validDate.value = isValidNotEmpty(data: txtDate.text);
      validateFormData();
    });
    txtGender.addListener(() {
      validGender.value = isValidNotEmpty(data: txtGender.text);
      validateFormData();
    });
    txtEmail.addListener(() {
      validEmail.value = isValidEmail(email: txtEmail.text);
      validateFormData();
    });
    txtNik.addListener(() {
      validNik.value = isValidIdNumber(idNumber: txtNik.text);
      validateFormData();
    });
    txtKtp.addListener(() {
      validKtp.value = isValidNotEmpty(data: txtKtp.text);
      validateFormData();
    });
    txtCity.addListener(() {
      validCity.value = isValidNotEmpty(data: txtCity.text);
      validateFormData();
    });
    txtAddress.addListener(() {
      validAddress.value = isValidNotEmpty(data: txtAddress.text);
      validateFormData();
    });
  }

  validateFormData() {
    isValidFormData.value = validImage.value &&
        validName.value &&
        validDate.value &&
        validGender.value &&
        validEmail.value &&
        validNik.value &&
        validKtp.value &&
        validCity.value &&
        validAddress.value;
  }

  Future<File> compressImage(XFile image) async {
    final dir = await path_provider.getTemporaryDirectory();
    var targetPath =
        "${dir.absolute.path}/temp-${DateTime.now().millisecondsSinceEpoch}.png";
    var compressFile = await FlutterImageCompress.compressAndGetFile(
      image.path,
      targetPath,
      quality: 70,
      format: CompressFormat.png,
    );
    return compressFile!;
  }

  getImgFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      var result = await compressImage(camImage);
      imgPreview.value = result.path;
      txtPic.text = 'image';
    }
  }

  getImgFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      imgPreview.value = result.path;
      txtPic.text = 'image';
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
                      getImgFromCamera();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getImgFromFile();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getKtpFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      var result = await compressImage(camImage);
      ktpPreview.value = result.path;
      txtKtp.text = 'ktp';
    }
  }

  getKtpFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      ktpPreview.value = result.path;
      txtKtp.text = 'ktp';
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
                      txtKtp.text = 'ktp';
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Image Gallery'),
                  onTap: () {
                    getKtpFromFile();
                    txtKtp.text = 'ktp';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
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

  buildGender() {
    return Get.defaultDialog(
      barrierDismissible: false,
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                gender.value = 'Laki-Laki';
                txtGender.text = 'Laki-Laki';
                genderActive.value = false;
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColor.neutral.shade200, width: 1))),
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
                    style: TextStyles.body3,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                gender.value = 'Perempuan';
                txtGender.text = 'Perempuan';
                genderActive.value = false;
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColor.neutral.shade200, width: 1))),
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
                    style: TextStyles.body3,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
              widget: CardItemRegister(
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
          widget: CardItemRegister(
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
            txtCity.text = 'city';
          } else {}
        },
        itemName: (value) {
          itemCities(value);
          txtCity.text = 'city';
        }).showSelection();
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
      if (gender == 'Laki-Laki') {
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
        phone: controllerRiderInfo.rider.value.phone,
        city: itemCities.value,
        idRider: controllerRiderInfo.rider.value.id,
        // status: statusUpdate.value,
        status: hasilstatus,
      );
      log(updateResult.toString());
      if (updateResult['success'] == true) {
        var result = updateResult["data"];
        await Api2().setRider(rider: result);
        var rider = MainRider.fromJson(result);
        Get.find<ControllerRiderInfo>().rider.value = rider;
        updateddata.value = true;
      } else {
        throw "Gagal memperbarui akun";
      }
      loadingForm.value = false;
    } catch (e) {
      loadingForm.value = false;
      log(e.toString());
      showPopUp(
        title: 'Terjadi Kesalahan',
        description: 'Pastikan data sudah benar',
        imageUri: PopUpIcons.error,
      );
      await Future.delayed(const Duration(seconds: 3));
      Get.back();
    }
  }

  //Form Register Vehicle//
  var txtSimNum = TextEditingController();
  var txtSimExp = TextEditingController();
  var txtPlatNum = TextEditingController();
  var txtVehicleVar = TextEditingController();
  var txtVehicleCol = TextEditingController();
  var txtSimPict = TextEditingController();
  var txtStnkPict = TextEditingController();
  var validSimNum = false.obs;
  var validSimExp = false.obs;
  var validPlatNum = false.obs;
  var validVehicleVar = false.obs;
  var validVehicleCol = false.obs;
  var validSimPict = false.obs;
  var validStnkPict = false.obs;
  var isValidFormVehicle = false.obs;
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
  var uploadSim = '';
  var uploadStnk = '';
  var statusUpdate = 0.obs;
  var updatedvehicle = false.obs;

  formVehicleValidationListener() {
    txtSimNum.addListener(() {
      validSimNum.value = isValidNotEmpty(data: txtSimNum.text);
      validateFormVehicle();
    });
    txtSimExp.addListener(() {
      validSimExp.value = isValidNotEmpty(data: txtSimExp.text);
      validateFormVehicle();
    });
    txtSimPict.addListener(() {
      validSimPict.value = isValidNotEmpty(data: txtSimPict.text);
      validateFormVehicle();
    });
    txtPlatNum.addListener(() {
      validPlatNum.value = isValidNotEmpty(data: txtPlatNum.text);
      validateFormVehicle();
    });
    txtVehicleVar.addListener(() {
      validVehicleVar.value = isValidNotEmpty(data: txtVehicleVar.text);
      validateFormVehicle();
    });
    txtVehicleCol.addListener(() {
      validVehicleCol.value = isValidNotEmpty(data: txtVehicleCol.text);
      validateFormVehicle();
    });
    txtStnkPict.addListener(() {
      validStnkPict.value = isValidNotEmpty(data: txtStnkPict.text);
      validateFormVehicle();
    });
  }

  validateFormVehicle() {
    isValidFormVehicle.value = validSimNum.value &&
        validSimExp.value &&
        validSimPict.value &&
        validPlatNum.value &&
        validVehicleVar.value &&
        validVehicleCol.value &&
        validStnkPict.value;
    log('isValidForm : ' + isValidFormVehicle.toString());
  }

  getVehicleData() async {
    try {
      var responData = await api.updateNebengRider(
          riderId: controllerRiderInfo.rider.value.id);
      if (responData['success'] == true) {
        idNebengRider.value = responData['data']['nebeng_rider']['id'];
        var result = responData['data'];
        var nebengRiderResult = NebengRider.fromJson(result);
        Get.find<ControllerVehicleInfo>().vehicle.value = nebengRiderResult;
      }
      controllerVehicleInfo.vehicle.value =
          NebengRider.fromJson(responData['data']['nebeng_rider']);
      return responData;
    } catch (e) {
      log(e.toString());
    }
  }

  getSimFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      var result = await compressImage(camImage);
      simPreview.value = result.path;
      txtSimPict.text = 'sim';
    }
  }

  getSimFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      simPreview.value = result.path;
      txtSimPict.text = 'sim';
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

  getStnkFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (camImage != null) {
      var result = await compressImage(camImage);
      stnkPreview.value = result.path;
      txtStnkPict.text = 'stnk';
    }
  }

  getStnkFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (fileImage != null) {
      var result = await compressImage(fileImage);
      stnkPreview.value = result.path;
      txtStnkPict.text = 'stnk';
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
        idRider: controllerRiderInfo.rider.value.id,
      );
      if (updateResult['success'] == true) {
        var result = updateResult["data"];
        await Api2().setVehicle(vehicle: result);
        var vehicle = NebengRider.fromJson(result);
        Get.find<ControllerVehicleInfo>().vehicle.value = vehicle;
        updatedvehicle.value = true;
      } else {
        showPopUpError(
          errorTitle: 'Gagal',
          errorMessage: 'Gagal memperbarui data',
        );
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
      showPopUp(
        title: 'Terjadi Kesalahan',
        description: 'Pastikan data sudah benar',
        imageUri: PopUpIcons.error,
      );
      await Future.delayed(const Duration(seconds: 3));
      Get.back();
    }
  }

  //Form Agreement//
  var statusCheck = false.obs;
  var agreementData = TermCondition().obs;
  var idAgreement = 0.obs;
  var statusAgreement = 0.obs;
  var agreementstatus = false.obs;
  var resultStatus = 0.obs;

  getDataAgreement() async {
    try {
      var response = await api.agreement();
      if (response['success'] == true) {
        agreementData.value = TermCondition.fromJson(response['data']);
        loading.value = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  getAgreementStatus() async {
    try {
      var responseData =
          await api.getAgreement(idRider: controllerRiderInfo.rider.value.id);
      idAgreement.value = responseData['data']['agreement']['id'];
      controllerAgreement.agreement.value =
          Agreement.fromJson(responseData['data']['getagreement']);
      return responseData;
    } catch (e) {
      log(e.toString());
    }
  }

  updateAgreement() async {
    try {
      var updateResult = await api.updateAgreement(
        idRider: controllerRiderInfo.rider.value.id,
        status: statusAgreement.value,
        idAgreement: idAgreement.value,
      );
      resultStatus.value = updateResult['data']['status'];
      agreementstatus.value = true;
      log(updateResult.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
