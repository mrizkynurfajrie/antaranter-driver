import 'package:antaranter_driverapp/framework/api1.dart';

class ApiLogin {
  Future<dynamic> userLogin({
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
