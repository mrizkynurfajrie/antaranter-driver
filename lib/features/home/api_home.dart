import 'package:intake_rider/framework/api1.dart';

class ApiHome {
  Future<dynamic> riderHome(int id) async {
    var response = await Api1().apiJSONGetWitToken('home/rider/$id');

    return response;
  }
}
