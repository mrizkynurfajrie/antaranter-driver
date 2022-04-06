import 'package:antaranter_driverapp/framework/api1.dart';

class ApiSaldo {
  Future<dynamic> getBalance({
    required int id,
  }) async {
    final payload = {
      "rider_id": id,
    };

    var r = await Api1().apiJSONPostWithToken("balance/findbyrider", payload);
    return r;
  }

  Future<dynamic> getTransaction({
    required int id,
  }) async {
    final payload = {
      "rider_id": id,
    };

    var r =
        await Api1().apiJSONPostWithToken("transactions/listbyrider", payload);
    return r;
  }
}
