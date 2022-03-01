import 'package:intake_rider/framework/api1.dart';
import 'package:intake_rider/shared/helpers/get_device_info.dart';

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
