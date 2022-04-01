import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/home_response.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();
  var homeResponse = HomeResponse().obs;

  var loading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }


  void getData() async {
    try {
      var res = await api.riderHome(controllerRiderInfo.rider.value.id ?? 0);
      if (res["success"] == true) {
        homeResponse.value = HomeResponse.fromJson(res["data"]);
        if (homeResponse.value.rider != null) {
          controllerRiderInfo.rider.value = homeResponse.value.rider!;
        }
      }
      homeResponse.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Kesalahan", "Terjadi Kesalahan");
    }
  }
}
