import 'package:antaranter_driverapp/framework/api1.dart';

class ApiAgreement{
  Future<dynamic> agreement () async {
    var response = await Api1().apiJSONGetWitToken('terms/3');
    return response;
  }
}