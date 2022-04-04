import 'package:intake_rider/framework/api1.dart';

class ApiHome {
    Future<dynamic> home({
    required int id,
  }) async {

    var r = await Api1().apiJSONGetWitToken("home/rider/$id");
    return r;
  }
}
