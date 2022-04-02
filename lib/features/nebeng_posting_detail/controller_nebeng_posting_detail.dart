import 'dart:developer';

import 'package:get/get.dart';
import 'package:intake_rider/features/nebeng_posting_detail/api_nebeng_posting_detail.dart';
import 'package:intake_rider/response/nebeng_order.dart';
import 'package:intake_rider/response/nebeng_posting_response.dart';
import 'package:intake_rider/response/users.dart';
import 'package:intake_rider/shared/controller/controller_postingan.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'package:intake_rider/shared/controller/controller_users.dart';
import 'package:intake_rider/shared/controller/controller_vehicle_info.dart';

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

  final listUserNebeng = List<NebengOrder>.empty().obs;

  @override
  void onInit() async {
    await getDataPosting();

    super.onInit();
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
}
