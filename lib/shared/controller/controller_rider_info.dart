import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/rider.dart';

class ControllerRiderInfo extends GetxController {
  var hasActiveOrder = false.obs;
  var rider = Rider().obs;

  @override
  void onInit() async {
    super.onInit();
    checkRiderHasActiveOrder();
    await setRiderData();
  }

  void setRiderHasActiveOrder(bool status) async {
    await Api2().setHasActiveOrder(isHasActiveOrder: status);
    hasActiveOrder.value = status;
  }

  void checkRiderHasActiveOrder() async {
    var isHasActiveOrder = await Api2().getHasActiveOrder();
    if (isHasActiveOrder != null) {
      setRiderHasActiveOrder(isHasActiveOrder);
    }
  }

  void setActiveOrder(int idOrder, String type) async {
    await Api2().setActiveOrder(activeOrder: {'id' : idOrder, 'type': type});
  }

  setRiderData() async {
    var data = await Api2().getRider();
    if (data != null) {
      rider.value = Rider.fromJson(data);
    }
  }
}
