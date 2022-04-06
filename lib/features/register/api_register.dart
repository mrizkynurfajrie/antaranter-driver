import 'package:intake_rider/framework/api1.dart';

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
}
