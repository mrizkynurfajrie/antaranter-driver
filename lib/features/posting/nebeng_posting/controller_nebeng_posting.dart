import 'dart:async';
import 'dart:developer';
import 'package:antaranter_driverapp/shared/constants/assets.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/controller/controller_balance.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_text.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/posting/nebeng_posting/api_nebeng_posting.dart';
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
  var controllerBalanceInfo = Get.find<ControllerBalanceInfo>();

  final ApiNebengPosting api;
  ControllerNebengPosting({required this.api});

  List dropDownList = ['1', '2', '3', '4', '5'];

  var txtSeatAvail = TextEditingController();
  var txtPrice = TextEditingController();
  var txtDateDept = TextEditingController();
  var txtDateArrv = TextEditingController();
  var txtTimeDept = TextEditingController();
  var txtTimeArrv = TextEditingController();
  var txtDesc = TextEditingController();
  var isValidForm = false.obs;
  var isValidPrice = false.obs;
  var itemProvinceDept = 'Provinsi'.obs;
  var itemCitiesDept = ''.obs;
  var itemProvinceArrv = 'Provinsi'.obs;
  var itemCitiesArrv = ''.obs;
  var dropDownValue = '1'.obs;
  var search = ''.obs;
  var valDesc = ''.obs;
  var idProvince = 0.obs;
  var idCities = 0.obs;
  var idRider = 0.obs;
  var idNebengRider = 0.obs;
  var statusNebeng = 0.obs;
  var provinces = <ModelBottomsheet>[].obs;
  var cities = <ModelBottomsheet>[].obs;
  var loading = false;
  final now = DateTime.now();
  var isSelectedProvince = false.obs;
  var availSeat = ''.obs;
  var selectedSeat = ''.obs;
  var isUrgent = 0.obs;
  var isUrgentCanceled = 0.obs;
  List listSeat = [].obs;
  var countSeat = 1.obs;
  var currentBalance = 0.obs;
  double calcPrice = 0;

  var maskFormatter = MaskTextInputFormatter(
    mask: '##.####' '###.###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void onInit() async {
    formValidationListener();
    await balanceCalc();
    await getVehicle();
    await getCities();
    // await getProvinces();
    isUrgent.value = 0;
    log('isurgent : ' + isUrgent.toString());
    super.onInit();
  }

  // @override
  // onClose() {
  //   super.onClose();
  //   // txtPrice.dispose();
  // }

  formValidationListener() {
    txtPrice.addListener(() {
      isValidPrice.value = txtPrice.text.isNotEmpty;
      validateForm();
    });
  }

  validateForm() {
    isValidForm.value = isValidPrice.value;
  }

  balanceCalc() async {
    try {
      var response =
          await api.getBalance(riderId: controllerRiderInfo.rider.value.id);
      log('response balance : ' + response.toString());
      if (response['success'] == true) {
        currentBalance.value = response['data']['curr_balance'];
        log('curr balance : ' + currentBalance.toString());
      }
    } catch (e) {}
  }

  // buildSeat () async {
  //   try {
  //     for (var i = 1; i < countSeat.value; i++) {
  //       listSeat.add(i);
  //     }
  //   } catch (e) {}
  // }

  buildavailSeat() {
    return Get.defaultDialog(
      title: 'Pilih Ketersediaan Tempat Duduk',
      titlePadding: EdgeInsets.symmetric(vertical: 20.h),
      titleStyle: TextStyles.inter.copyWith(
        fontSize: FontSizes.s14,
        fontWeight: FontWeight.w500,
        color: AppColor.primaryColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
      content: SizedBox(
        height: Get.height * 0.33.h,
        width: Get.width * 0.50.w,
        child: CardRounded(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      availSeat.value = '1';
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
                        title: Text(
                          '1',
                          style: TextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      availSeat.value = '2';
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
                        title: Text(
                          '2',
                          style: TextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      availSeat.value = '3';
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
                        title: Text(
                          '3',
                          style: TextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      availSeat.value = '4';
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
                        title: Text(
                          '4',
                          style: TextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      availSeat.value = '5';
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
                        title: Text(
                          '5',
                          style: TextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getVehicle() async {
    try {
      var r =
          await api.getVehicleInfo(riderId: controllerRiderInfo.rider.value.id);
      // log('data r' + r.toString());
      idNebengRider.value = r["data"]["nebeng_rider"]["id"];
      controllerVehicleInfo.vehicle.value =
          NebengRider.fromJson(r["data"]["nebeng_rider"]);
      return r;
    } catch (e) {
      log(e.toString());
    }
  }

  // getProvinces() async {
  //   try {
  //     var r = await api.getProvince();

  //     for (var x in r['data']) {
  //       provinces.add(
  //         ModelBottomsheet(
  //             itemName: x['name'],
  //             widget: CardItem(
  //               data: x,
  //             ),
  //             value: x['id']),
  //       );
  //       provinces.sort((a, b) => a.itemName.compareTo(b.itemName));
  //     }
  //   } catch (_) {}
  // }

  getCities() async {
    try {
      cities.clear();
      var r = await api.getCityByRegion(
          idRegion: controllerRiderInfo.region.value.id!);
      // log('data r : ' + r.toString());
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

  // buildProvince(context) {
  //   BottomsheetSelection(
  //     title: 'Pilih Provinsi',
  //     context: context,
  //     labelButton: '',
  //     listWidget: provinces,
  //     value: (value) async {
  //       if (value != null) {
  //         search('');
  //         idProvince(value);
  //         Navigator.pop(context);
  //         getCities();
  //       }
  //     },
  //     itemName: (value) {
  //       itemProvinceDept(value);
  //     },
  //   ).showSelection();
  // }

  buildCities(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search('');
            // search(value);
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          itemCitiesDept(value);
        }).showSelection();
  }

  // buildProvinceArrv(context) {
  //   BottomsheetSelection(
  //       title: 'Pilih Provinsi',
  //       context: context,
  //       listWidget: provinces,
  //       value: (value) async {
  //         if (value != null) {
  //           search('');
  //           idProvince(value);
  //           await getCities();
  //         }
  //       },
  //       itemName: (value) {
  //         itemProvinceArrv(value);
  //       }).showSelection();
  // }

  buildCitiesArrv(context) {
    BottomsheetSelection(
        title: 'Pilih Kota',
        context: context,
        listWidget: cities,
        value: (value) async {
          if (value != null) {
            search('');
            // idCities(value);
            // search(value);
            Navigator.pop(context);
          }
        },
        itemName: (value) {
          itemCitiesArrv(value);
        }).showSelection();
  }

  popupDesc() {
    Get.defaultDialog(
      title: 'Catatan Perjalanan',
      titleStyle: TextStyles.inter.copyWith(
        fontSize: FontSizes.s16,
        color: AppColor.neutral,
        fontWeight: FontWeight.w500,
      ),
      titlePadding:
          EdgeInsets.only(top: 15.h, bottom: 10.h, left: 10.w, right: 10.w),
      contentPadding: EdgeInsets.only(bottom: 25.h, left: 10.w, right: 10.w),
      content: CardRounded(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.zero,
        width: Get.width,
        shadow: Shadows.universal,
        color: AppColor.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Apakah anda ingin memberikan catatan pada perjalanan anda?',
              style: TextStyles.inter.copyWith(
                  fontSize: FontSizes.s12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.neutral),
              textAlign: TextAlign.justify,
            ),
            verticalSpace(10.h),
            InputPrimary(
              hintText: 'Tuliskan catatan perjalanan',
              hintFontStyle: FontStyle.italic,
              controller: txtDesc,
              onTap: () {},
              maxLenght: 100,
              maxLines: 3,
              // boxWidth: Get.width * 0.65.w,
            ),
          ],
        ),
      ),
      confirm: ButtonPrimary(
        cornerRadius: 8,
        height: Get.height * 0.06.h,
        size: Get.width,
        onPressed: () async {
          await checkDesc();
          createNebengPosting();
        },
        label: 'Bagikan',
        color: AppColor.primaryColor,
        labelStyle: TextStyles.inter.copyWith(
          fontSize: FontSizes.s14,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  checkDesc() async {
    if (txtDesc.text.isEmpty) {
      valDesc.value = '-';
    } else {
      valDesc.value = txtDesc.text;
    }
  }

  createNebengPosting() async {
    try {
      loading = true;
      var priceformatted = txtPrice.text.replaceAll(RegExp('[^A-Za-z0-9]'), '');
      // var dateDept = DateTime.parse(txtDateDept.text);
      // var dateArrv = DateTime.parse(txtDateArrv.text);
      // var parsedDateDept = FormatDateTime.formatDate(value: dateDept);
      // log("parsed date : " + parsedDateDept.toString());
      // var parsedDateArrv = FormatDateTime.formatDate(value: dateArrv);
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
        desc: valDesc.value,
        isUrgent: isUrgent.value,
      );

      log('hasil data : ' + updateResult.toString());
      if (updateResult['success'] == true) {
        controllerRiderInfo.setRiderHasActivePost(true);
        var result = updateResult["data"];
        var postResponse = Post.fromJson(result);
        controllerRiderInfo.setActivePost(postResponse.id!);
        showPopUp(
            title: 'Nebeng',
            description: 'Anda telah berhasil membagikan perjalanan anda',
            imageUri: PopUpIcons.success);
        await Future.delayed(const Duration(seconds: 2));
        Get.offAllNamed(Routes.main, arguments: 1);
      } else {
        showPopUp(
          title: 'Gagal',
          description: 'Anda sudah memiliki perjalanan aktif',
          imageUri: PopUpIcons.error,
        );
        await Future.delayed(const Duration(seconds: 2));
        Get.back();
      }
      // await Future.delayed(const Duration(seconds: 3));
      // Get.offAllNamed(Routes.main);

      loading = false;
    } catch (e) {
      loading = false;
      log(e.toString());
    }
  }
}
