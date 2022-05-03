import 'package:antaranter_driverapp/framework/api1.dart';

class ApiTermsProfile {
  Future<dynamic> terms () async {
    var response = await Api1().apiJSONGetWitToken('terms/1');

    return response;
  }
}