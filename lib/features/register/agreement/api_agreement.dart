import 'package:antaranter_driverapp/framework/api1.dart';

class ApiAgreement {
  Future<dynamic> agreement() async {
    var response = await Api1().apiJSONGetWitToken('terms/3');
    return response;
  }

  Future<dynamic> getAgreement({required var idRider}) async {
    final payload = {"rider_id": idRider};
    var response =
        await Api1().apiJSONPostWithToken("agreements/findbyrider", payload);
    return response;
  }

  Future<dynamic> updateAgreement({
    required var idRider,
    required var status,
    required var idAgreement,
  }) async {
    final payload = {
      "rider_id": idRider,
      "status": status,
    };
    var response = await Api1()
        .apiJSONPostWithToken('agreements/update/$idAgreement', payload);
    return response;
  }
}
