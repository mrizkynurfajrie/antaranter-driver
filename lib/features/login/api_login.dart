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

  Future<dynamic> agreementByRiderId({required int riderId}) async {
    final body = {
      'rider_id': riderId,
    };
    var r = await Api1().apiJSONPostWithToken('agreements/findbyrider', body);
    return r;
  }
}
