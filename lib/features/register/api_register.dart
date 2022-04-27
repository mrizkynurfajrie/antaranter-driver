import 'dart:developer';

import 'package:antaranter_driverapp/framework/api1.dart';

class ApiRegister {
  //contoh
  Future<dynamic> userRegister({
    required String name,
    required String password,
    required String phone,
  }) async {
    final payload = {
      "name": name,
      "password": password,
      "phone": phone,
    };

    var r = await Api1().apiJSONPost("register-rider", payload);
    return r;
  }

  Future<dynamic> createNebengRider({
    required int idRider,
  }) async {
    final payload = {
      "rider_id": idRider,
    };

    var r = await Api1().apiJSONPost('register-nebeng-rider', payload);

    return r;
  }

  Future<dynamic> termNebeng() async {
    var response = await Api1().apiJSONGetWitToken("terms/1");

    return response;
  }

  Future<dynamic> autoLogin({
    required String phoneNumber,
    required String password,
    required String fcm,
  }) async {
    final loginBody = {
      "phone": phoneNumber,
      "password": password,
      "fcm": fcm,
    };

    var apiLoginResponse = await Api1().apiJSONPost("login-rider", loginBody);
    return apiLoginResponse;
  }
}
