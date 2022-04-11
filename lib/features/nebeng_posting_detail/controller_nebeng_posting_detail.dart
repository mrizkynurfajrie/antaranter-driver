import 'dart:developer';
import 'dart:io';
import 'package:antaranter_driverapp/shared/widgets/cards/card_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:antaranter_driverapp/framework/api2.dart';
import 'package:antaranter_driverapp/response/nebeng_order.dart';
import 'package:antaranter_driverapp/response/nebeng_posting.dart';
import 'package:antaranter_driverapp/response/nebeng_posting_response.dart';
import 'package:antaranter_driverapp/response/users.dart';
import 'package:antaranter_driverapp/routes/app_routes.dart';
import 'package:antaranter_driverapp/shared/constants/colors.dart';
import 'package:antaranter_driverapp/shared/constants/styles.dart';
import 'package:antaranter_driverapp/shared/controller/controller_postingan.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_users.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';
import 'package:antaranter_driverapp/shared/widgets/buttons/button_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/cards/card_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_primary.dart';
import 'package:antaranter_driverapp/shared/widgets/inputs/input_time.dart';
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
  var isEmpty = false;
  var statusNebeng = 2.obs;
  var balance = 0.obs;

  var txtTimeDept = TextEditingController();
  var txtTimeArrv = TextEditingController();
  var txtNote = TextEditingController();
  var dateTimeStart = DateTime.now();

  final listUserNebeng = List<NebengOrder>.empty().obs;

  @override
  void onInit() async {
    await getDataPosting();

    super.onInit();
  }

  ourWa(String? phoneNum) async {
    var editedPhone = phoneNum!.replaceFirst(RegExp(r'^0+'), "");
    var whatsapp = "+62$editedPhone";
    var whatsappURlAndroid =
        "https://wa.me/$whatsapp?text=${Uri.parse("halo, saya driver yang akan mengantarkan anda sampai ke tujuan")}";
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
        try {
          idNebengRider.value = r["data"]["nebeng_rider"]["id"];
          var nebengPostingRes = NebengPostingResponse.fromJson(r["data"]);
          statusNebeng.value = nebengPostingRes.nebengPosting!.status!;
          log("status nebeng value : " + statusNebeng.toString());
          controllerPostingan.postingan.value = nebengPostingRes;
          listUserNebeng.clear();
          if (nebengPostingRes.nebengOrder != null) {
            listUserNebeng.addAll(nebengPostingRes.nebengOrder!);
          }
        } catch (e) {
          controllerRiderInfo.hasActivePost.value = false;
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
        content: CardRounded(
          width: Get.width,
          color: AppColor.bgPageColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputTime(
                label: 'Waktu Berangkat',
                controller: txtTimeDept,
                hintText:
                    controllerPostingan.postingan.value.nebengPosting?.timeDep,
                selectedTime: (value) {},
                isValid: (value) {},
                boxWidth: Get.width * 0.65,
              ),
              verticalSpace(15.h),
              InputTime(
                label: 'Waktu Tiba',
                controller: txtTimeArrv,
                hintText:
                    controllerPostingan.postingan.value.nebengPosting?.timeArr,
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
              Get.snackbar(
                "Ubah Waktu",
                "Berhasil ubah waktu",
                snackPosition: SnackPosition.TOP,
              );
            } else {
              Get.snackbar(
                "Gagal",
                "Anda gagal mengubah waktu",
                snackPosition: SnackPosition.TOP,
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
      content: CardRounded(
        width: Get.width,
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
          var hasil = await hapusPosting();
          if (hasil == true) {
            Get.snackbar("Batalkan Pesanan", "Berhasil membatalkan pesanan");
            Get.offAllNamed(Routes.main);
          } else {
            Get.snackbar(
              "Gagal",
              "Gagal membatalkan pesanan",
              snackPosition: SnackPosition.TOP,
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
          timeArrv: txtTimeArrv.text);
      log("update waktu : " + updateResult.toString());
      if (updateResult["success"] == true) {
        var result = updateResult["data"]["nebeng_post"];
        log("result : " + result.toString());
        controllerPostingan.postingan.value.nebengPosting =
            NebengPosting.fromJson(result);
        controllerPostingan.postingan.refresh();
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
      log('hapus posting :' + updateResult.toString());
      if (updateResult["success"] == true) {
        var result = updateResult["data"];
        log("result : " + result.toString());
        controllerPostingan.postingan.value.nebengPosting?.status = 4;
        controllerPostingan.postingan.value = NebengPostingResponse();
        controllerRiderInfo.setRiderHasActivePost(false);
        isEmpty = true;
        await Api2().removePosting();
        await Api2().removeActivePost();
        return true;
      } else {
        throw "Gagal membatalkan pesanan";
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> ubahStatus(int status) async {
    try {
      var updateResult = await api.changeStatus(
        status: status,
        nebengPostId: controllerPostingan.postingan.value.nebengPosting!.id,
        dateTimeStart: dateTimeStart.toString(),
      );
      log("data update status : " + updateResult.toString());
      if (updateResult["success"] == true) {
        var result = updateResult["data"]["nebeng_post"];
        log("result : " + result.toString());
        controllerPostingan.postingan.value.nebengPosting =
            NebengPosting.fromJson(result);
        statusNebeng.value =
            controllerPostingan.postingan.value.nebengPosting!.status!;
        controllerPostingan.postingan.refresh();
        var statusUpdate = controllerPostingan.postingan.value.nebengPosting;
        if (statusUpdate?.status == 3) {
          await updateStatusDone();
          controllerPostingan.postingan.value = NebengPostingResponse();
          controllerRiderInfo.setRiderHasActivePost(false);
          await Api2().removePosting();
          await Api2().removeActivePost();
          isEmpty = false;
          controllerPostingan.postingan.refresh();
          return true;
        }
        return true;
      } else {
        throw "Gagal mengubah status";
      }
    } catch (e) {
      return false;
    }
  }

  onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    getDataPosting();
  }

  updateStatusDone() async {
    var dateTimeFinish = DateTime.now();
    try {
      var r = await api.updateBalance(
        nebengPostId: controllerPostingan.postingan.value.nebengPosting?.id,
        datetimeFinish: dateTimeFinish.toString(),
      );
      log("nebeng post id : " + r.toString());
      if (r["success"] == true) {
        var updateBalance = r["data"]["currBalance"]["curr_balance"];
        balance.value = updateBalance;
      }
    } catch (e) {}
  }
}
