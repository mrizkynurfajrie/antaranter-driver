import 'dart:developer';

import 'package:antaranter_driverapp/response/balance.dart';
import 'package:antaranter_driverapp/shared/controller/controller_postingan.dart';
import 'package:antaranter_driverapp/shared/widgets/others/show_dialog.dart';
import 'package:get/get.dart';
import 'package:antaranter_driverapp/features/home/api_home.dart';
import 'package:antaranter_driverapp/response/home_response.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';
import 'package:antaranter_driverapp/shared/controller/controller_vehicle_info.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var balance = Balance().obs;

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerPosting = Get.find<ControllerPostingan>();

  var loading = false.obs;
  var homeResponse = HomeResponse().obs;
  var idNebengRider = 0.obs;
  var statusPost = 0.obs;
  var balancedWarning = false.obs;
  var balancedValue = 0.obs;

  @override
  onInit() async {
    await getData();
    getDataBalance();
    // await getDataPosting();

    super.onInit();
  }

  getData() async {
   
    try {
      loading.value = true;
      var res = await api.riderHome(controllerRiderInfo.rider.value.id ?? 0);

      if (res["success"] == true) {
        homeResponse.value = HomeResponse.fromJson(res["data"]);
        if (homeResponse.value.rider != null) {
          controllerRiderInfo.rider.value = homeResponse.value.rider!;
        }
        if (homeResponse.value.region != null) {
          controllerRiderInfo.region.value = homeResponse.value.region!;
        }
      }
      controllerRiderInfo.rider.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      showPopUpError(
        errorTitle: 'Kesalahan',
        errorMessage: 'Terjadi Kesalahan',
      );
    }
  }

  void getDataBalance() async {
    loading.value = true;
    try {
      // print(controllerRiderInfo.rider.value.id);
      var res = await api.getBalance(
        id: controllerRiderInfo.rider.value.id ?? 0,
      );
      // print(res);
      if (res['success'] == true) {
        balance.value = Balance.fromJson(res['data']);
        balancedValue.value = res['data']['curr_balance'];
        balancedValue.value == 0
            ? balancedWarning.value = true
            : balancedWarning.value = false;

        loading.value = false;
      } else {
        throw "Status response false";
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }

  // getDataPosting() async {
  //   var idRider = controllerRiderInfo.rider.value.id;
  //   try {
  //     var r = await api.detailNebengPosting(
  //         riderId: idRider);
  //     log("data r : " + r.toString());
  //     if (r["success"] == true) {
  //       idNebengRider.value = r["data"]["nebeng_rider"]["id"];
  //       var nebengPostingRes = NebengPostingResponse.fromJson(r["data"]);
  //       statusPost.value = nebengPostingRes.nebengPosting!.status!;
  //       log("status nebeng value : " + statusPost.toString());
  //       controllerPosting.postingan.value = nebengPostingRes;
  //     }
  //   } catch (e) {}
  // }
}
