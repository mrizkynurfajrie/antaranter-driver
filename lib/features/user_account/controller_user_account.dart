import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_rider/features/user_account/api_user_account.dart';

class ControllerUserAccount extends GetxController {
  final ApiUserAccount api;
  ControllerUserAccount({required this.api});

  var txtEmail = TextEditingController();
}
