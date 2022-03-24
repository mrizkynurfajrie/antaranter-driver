import 'package:intake_rider/framework/api1.dart';

class ApiOrder {
  Future<dynamic> getProvince() async {
    var responseProvince = await Api1().apiJSONGet("provincies/list");

    return responseProvince;
  }

  Future<dynamic> getCity() async {
    var responseCity = await Api1().apiJSONGet("cities/list");

    return responseCity;
  }
}
