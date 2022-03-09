import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'api_order.dart';

class ControllerOrder extends GetxController {
  final ApiOrder api;
  ControllerOrder({required this.api});
  var dropDownValue = '1'.obs;
  List dropDownList = ['1','2','3','4','5'];
  
  var ctrlDate = TextEditingController();

}
