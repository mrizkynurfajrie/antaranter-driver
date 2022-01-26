import 'package:intakemobile/framework/api1.dart';
import 'package:intakemobile/shared/helpers/get_device_info.dart';

class ApiLogin {
  //contoh
  Future<dynamic> userLogin({
    required String username,
    required String password,
    String? phoneNumber,
    String passType = "P",
  }) async {
    String deviceId = await DeviceInfo.deviceInfo();

    final payload = {
      "username": username,
      "password": password,
      "device_id": deviceId,
      "allow_any_devices": "T",
      "clientid": "autopay01",
      "passtype": passType,
    };

    var r = await Api1().apiJSONPost("auth/access-login", payload);
    return r.data;
  }
}
