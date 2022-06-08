import 'package:antaranter_driverapp/response/region.dart';
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

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var controllerVehicleInfo = Get.find<ControllerVehicleInfo>();
  var controllerPosting = Get.find<ControllerPostingan>();

  var loading = false.obs;
  var homeResponse = HomeResponse().obs;
  var idNebengRider = 0.obs;
  var statusPost = 0.obs;

  @override
  onInit() async {
    await getData();
    // await getDataPosting();
    
    super.onInit();
  }

  getData() async {
    try {
      var res = await api.riderHome(controllerRiderInfo.rider.value.id ?? 0);
      if (res["success"] == true) {
        homeResponse.value = HomeResponse.fromJson(res["data"]);
        if (homeResponse.value.rider != null) {
          controllerRiderInfo.rider.value = homeResponse.value.rider!;
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
