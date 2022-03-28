import 'package:intake_rider/framework/api1.dart';
import 'package:intake_rider/shared/helpers/get_device_info.dart';

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
}
