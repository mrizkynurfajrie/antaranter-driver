import 'package:intake_rider/framework/api1.dart';

class ApiLogin {
  Future<dynamic> userLogin({
    required String phoneNumber,
    required String password,
  }) async {

    final loginBody = {
      "phone": phoneNumber,
      "password": password,
    };

    var apiLoginResponse = await Api1().apiJSONPost("login-rider", loginBody);
    return apiLoginResponse;
  }
}
