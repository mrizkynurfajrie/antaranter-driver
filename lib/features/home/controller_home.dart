import 'package:get/get.dart';
import 'package:intake_rider/features/home/api_home.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:flutter/material.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  final name = ''.obs;
  final image = ''.obs;
  final phone = ''.obs;

  void setRider() async {
    var rider = await Api2().getRider();
    name.value = rider['name'] ?? 'Rider';
    image.value = rider['image'] ?? 'No Image';
    phone.value = rider['phone'] ?? '08xxxxx';
  }
}
