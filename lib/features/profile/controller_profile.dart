import 'dart:developer';
import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/routes/app_routes.dart';
import 'package:intake_rider/shared/controller/controller_rider_info.dart';
import 'api_profile.dart';

class ControllerProfile extends GetxController {
  var controllerRiderInfo = Get.find<ControllerRiderInfo>();

  final ApiProfile api;
  ControllerProfile({required this.api});

  final name = ''.obs;
  final phone = ''.obs;
  final image = ''.obs;

  @override
  void onInit() async {
    // setRider();
    var rider = await Api2().getRider();
    log(rider.toString());
    name.value = rider['name'] ?? 'Rider';
    phone.value = rider['phone'] ?? '08xxxxxxxx';
    image.value = rider['image'] ?? '';
    super.onInit();
  }

  // void setRider() async {
  //   var rider = await Api2().getRider();
  //   log(rider.toString());
  //   name.value = rider['name'] ?? 'Rider';
  //   phone.value = rider['phone'] ?? '08xxxxxxxx';
  //   image.value = rider['image'] ?? '';
  // }

  void logout() async {
    await Api2().removeData();
    Get.offAllNamed(Routes.login);
  }
}
