import 'package:get/get.dart';
import 'package:intake_rider/framework/api2.dart';
import 'package:intake_rider/response/users.dart';

class ControllerUsers extends GetxController{
  var users = Users().obs;

  @override
  void onInit () async {
    super.onInit();
    await setUserData();
  }

  setUserData () async {
    var data = await Api2().getUser();
    if (data != null) {
      users.value = Users.fromJson(data);
    }
  }
}