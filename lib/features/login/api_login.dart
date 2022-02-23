import 'package:intake_rider/framework/api1.dart';
import 'package:intake_rider/shared/helpers/get_device_info.dart';

class ApiLogin {
  Future<dynamic> userLogin({
    required String phoneNumber,
    required String password,
  }) async {
    String deviceId = await DeviceInfo.deviceInfo();

    final loginBody = {
      "username": phoneNumber,
      "password": password,
    };

    var r = await Api1().apiJSONPost("login-rider", loginBody);
    return r.data;
  }
}
