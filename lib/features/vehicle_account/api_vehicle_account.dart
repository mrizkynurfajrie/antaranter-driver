import 'package:intake_rider/framework/api1.dart';

class ApiVehicleAccount {
  Future<dynamic> updateVehicleAccount({
    required var simNum,
    required var simExp,
    required var simPict,
    required var platNum,
    required var vehicleVar,
    required var vehicleCol,
    required var stnkPict,
    required var idRider,
  }) async {
    final inputBody = {
      "sim": simNum,
      "simExp": simExp,
      "simPict": simPict,
      "plat_number": platNum,
      "vehicle_variant": vehicleVar,
      "vehicle_color": vehicleCol,
      "stnkPict": stnkPict,
    };

    var apiVehicleAccountResponse = await Api1()
        .apiJSONPostWithToken('nebengriders/update/$idRider', inputBody);

        return apiVehicleAccountResponse;
  }

  Future<dynamic>uploadSimImg({required String simImg}) async {
    var upload = Api1().apiJSONMultipartWithToken(simImg, 'upload');

    return upload;
  }

  Future<dynamic>uploadStnkImg({required String stnkImg}) async {
    var upload = Api1().apiJSONMultipartWithToken(stnkImg, 'upload');

    return upload;
  }
}
