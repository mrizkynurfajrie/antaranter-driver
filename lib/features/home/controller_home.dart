import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/framework/api2.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  final name = ''.obs;
  final pict = ''.obs;
  final phone = ''.obs;

  @override
  void onInit() {
    setRider();
    super.onInit();
  }

  void setRider() async {
    var rider = await Api2().getRider();
    name.value = rider['name'] ?? 'Rider';
    pict.value = rider['pict'] ?? 'No Image';
    phone.value = rider['phone'] ?? '08xxxxx';
  }
}
