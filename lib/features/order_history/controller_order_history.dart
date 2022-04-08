import 'dart:developer';

import 'package:get/get.dart';
import 'package:antaranter_driverapp/response/post.dart';
import 'package:antaranter_driverapp/shared/controller/controller_rider_info.dart';

import 'api_order_history.dart';

class ControllerOrderHistory extends GetxController
    with StateMixin<List<Post>> {
  final ApiOrderHistory api;
  ControllerOrderHistory({required this.api});

  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  var listHistory = List<Post>.empty().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    int riderId = controllerRiderInfo.rider.value.id ?? 0;

    try {
      var res = await api.getHistoryPosting(
        id: riderId,
      );
      if (res['success'] == true) {
        var data = res['data']['postList'];
        log(data.toString());
        var resultHistory =
            (data as List).map((data) => Post.fromJson(data)).toList();
        // print(resultHistory.toString());
        if (resultHistory.isNotEmpty) {
          listHistory.clear();
          listHistory.addAll(resultHistory);
          change(listHistory, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        throw "Gagal memuat data";
      }
    } catch (e) {
      log(e.toString());
      change(null, status: RxStatus.error(e.toString()));
      Get.snackbar("Terjadi kesalahan", e.toString());
    }
  }
}
