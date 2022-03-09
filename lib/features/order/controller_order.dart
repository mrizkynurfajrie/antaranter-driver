import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'api_order.dart';

class ControllerOrder extends GetxController {
  final ApiOrder api;
  ControllerOrder({required this.api});

  List dropDownList = ['1', '2', '3', '4', '5'];
  var dropDownValue = '1'.obs;
  var ctrlDateDept = TextEditingController();
  var ctrlTimeDept = TextEditingController();
  var ctrlDateArrv = TextEditingController();
  var ctrlTimeArrv = TextEditingController();
  // TimeOfDay selectedTime = TimeOfDay.now();

  // inputTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime){
  //     selectedTime = timeOfDay;
  //   }
  // }
}
