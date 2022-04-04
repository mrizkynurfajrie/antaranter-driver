import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:intake_rider/response/nebeng_order.dart';
import 'package:intake_rider/response/nebeng_posting_response.dart';
import 'package:intake_rider/response/users.dart';
import 'package:intake_rider/shared/constants/colors.dart';
import 'package:intake_rider/shared/constants/styles.dart';
import 'package:intake_rider/shared/controller/controller_postingan.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_users.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';
import 'package:intake_rider/shared/widgets/buttons/button_primary.dart';
import 'package:intake_rider/shared/widgets/cards/card_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_primary.dart';
import 'package:intake_rider/shared/widgets/inputs/input_time.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerNebengPostingDetail extends GetxController
    with StateMixin<List<NebengOrder>> {
  var controllerUserInfo = Get.find<ControllerUsers>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerPostingan = Get.find<ControllerPostingan>();

  final ApiNebengPostingDetail api;
  ControllerNebengPostingDetail({required this.api});

  var userOrder = Users().obs;
  var loading = false.obs;
  var idNebengRider = 0.obs;
  var isPosting = true;

  var txtTimeDept = TextEditingController();
  var txtTimeArrv = TextEditingController();
  var txtNote = TextEditingController();

  final listUserNebeng = List<NebengOrder>.empty().obs;

  @override
  void onInit() async {
    await getDataPosting();

    super.onInit();
  }

  ourWa(String? phoneNum) async {
    var whatsapp = phoneNum;
    var whatsappURlAndroid = "https://wa.me/$whatsapp?text=${Uri.parse("halo driver saya telah memesan nebeng anda")}";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "whatsapp no installed");
      }
    } else {
      // android , web
  
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        Get.snackbar('Attention', "whatsapp no installed android");
      }
    }
  }

  getDataPosting() async {
    change(null, status: RxStatus.loading());
    try {
      loading.value = true;
      var r = await api.detailNebengPosting(
          riderId: controllerRiderInfo.rider.value.id);
      log('data nebeng' + r.toString());
      if (r["success"] == true) {
        idNebengRider.value = r["data"]["nebeng_rider"]["id"];
        var nebengPostingRes = NebengPostingResponse.fromJson(r["data"]);
        controllerPostingan.postingan.value = nebengPostingRes;
        log('disini aja');
        if (nebengPostingRes.nebengOrder != null) {
          listUserNebeng.addAll(nebengPostingRes.nebengOrder!);
        }

        change(listUserNebeng, status: RxStatus.success());
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  

  dialogUbah() {
    return Get.defaultDialog(
        title: 'Ubah Waktu Perjalanan',
        titleStyle: TextStyles.inter.copyWith(
            color: AppColor.primaryColor, fontWeight: FontWeight.w500),
        titlePadding: EdgeInsets.only(bottom: 15.h, top: 20.h),
        backgroundColor: AppColor.whiteColor,
        radius: 10,
        barrierDismissible: false,
        content: CardPrimary(
          width: Get.width,
          height: Get.height * 0.28,
          color: AppColor.bgPageColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTime(
                label: 'Waktu Berangkat',
                controller: txtTimeDept,
                selectedTime: (value) {},
                isValid: (value) {},
                boxWidth: Get.width * 0.65,
              ),
              verticalSpace(15.h),
              InputTime(
                label: 'Waktu Tiba',
                controller: txtTimeArrv,
                selectedTime: (value) {},
                isValid: (value) {},
                boxWidth: Get.width * 0.65,
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
        confirm: ButtonPrimary(
          onPressed: () async {
            var hasil = await ubahWaktu();
            if (hasil == true) {
              Get.back();
            } else {
              Get.snackbar(
                "Gagal",
                "Anda gagal mengubah waktu",
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          label: 'Ubah',
          cornerRadius: 4,
          size: 300,
          height: Get.height * 0.06.h,
          labelStyle: TextStyles.inter.copyWith(color: AppColor.whiteColor),
        ),
        cancel: ButtonPrimary(
          onPressed: () {
            txtTimeDept.clear();
            txtTimeArrv.clear();
            Get.back();
          },
          label: 'Batal',
          cornerRadius: 4,
          size: 300,
          height: Get.height * 0.06.h,
          color: AppColor.whiteColor,
          labelStyle: TextStyles.inter.copyWith(color: AppColor.errorColor),
          borderColor: AppColor.errorColor,
        ));
  }

  dialogBatal() {
    txtNote.clear();
    return Get.defaultDialog(
      title: 'Yakin Ingin Membatalkan Perjalanan?',
      titleStyle: TextStyles.inter
          .copyWith(color: AppColor.primaryColor, fontWeight: FontWeight.w500),
      titlePadding: EdgeInsets.only(bottom: 15.h, top: 20.h),
      backgroundColor: AppColor.whiteColor,
      radius: 10,
      content: CardPrimary(
        width: Get.width,
        height: Get.height * 0.22,
        color: AppColor.bgPageColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputPrimary(
              hintText: 'Alasan Pembatalan',
              controller: txtNote,
              onTap: () {},
              prefixIcon: Icon(
                Icons.note,
                color: AppColor.primaryColor,
                size: IconSizes.med,
              ),
              maxLenght: 100,
              maxLines: 4,
              boxWidth: Get.width * 0.65.w,
            ),
            verticalSpace(20.h),
          ],
        ),
      ),
      confirm: ButtonPrimary(
        onPressed: () async {
          var hasil = await ubahWaktu();
          if (hasil == true) {
            Get.back();
          } else {
            Get.snackbar(
              "Gagal",
              "Gagal membatalkan pesanan",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        label: 'Batalkan Perjalanan',
        cornerRadius: 4,
        size: 300,
        height: Get.height * 0.06.h,
        labelStyle: TextStyles.inter.copyWith(color: AppColor.whiteColor),
      ),
    );
  }

  Future<bool> ubahWaktu() async {
    try {
      var updateResult = await api.updateSchedule(
        postingId: controllerPostingan.postingan.value.nebengPosting?.id,
        timeDep: txtTimeDept.text,
        timeArrv: txtTimeArrv.text,
      );
      if (updateResult == "success") {
        var result = updateResult["data"]["nebeng_post"];
        log("result : " + result);
        Get.snackbar("Ubah Waktu", "Berhasil ubah waktu");
        return true;
      } else {
        throw "Gagal mengubah waktu";
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> hapusPosting() async {
    try {
      var updateResult = await api.deletePosting(
        nebengPostingId: controllerPostingan.postingan.value.nebengPosting?.id,
        note: txtNote.text,
      );
      if (updateResult == "success") {
        var result = updateResult["data"]["nebeng_post"];
        log("result : " + result);
        Get.snackbar("Batalkan Pesanan", "Berhasil membatalkan pesanan");
        return true;
      } else {
        throw "Gagal membatalkan pesanan";
      }
    } catch (e) {
      return false;
    }
  }
}