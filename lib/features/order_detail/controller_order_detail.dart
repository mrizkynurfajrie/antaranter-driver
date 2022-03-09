import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/order_detail/api_order_detail.dart';

class ControllerOrderDetail extends GetxController {
  final ApiOrderDetail api;
  ControllerOrderDetail({required this.api});

  RxBool isOrder = true.obs;
}
