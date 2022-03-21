import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  final ApiProfile api;
  ControllerProfile({required this.api});

  final name = ''.obs;
  final phone = ''.obs;
  final pict = ''.obs;

  @override
  void onInit(){
    setRider();
    super.onInit();
  }

  void setRider() async {
    var rider = await Api2().getRider();
    name.value = rider['name'] ?? 'Rider';
    phone.value = rider['phone'] ?? '08xxxxxxxx';
    pict.value = rider['pict'] ?? '';
  }
}
