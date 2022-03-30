import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intake_rider/framework/api1.dart';
import 'package:intake_rider/shared/helpers/get_device_info.dart';

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
    required int statusNebeng,
    required String sim,
    required String simPict,
    required String stnkPict,
    required int rating,
    required String vehicleVariant,
    required String platNumber,
    required String vehicleColor,
  }) async {
    final payload = {
      "rider_id": idRider,
      "statusNebeng": statusNebeng,
      "sim": sim,
      "simPict": simPict,
      "stnkPict": stnkPict,
      "rating": rating,
      "vehicle_variant": vehicleVariant,
      "plat_number": platNumber,
      "vehicle_color": vehicleColor,
    };

    var r = await Api1().apiJSONPost('nebengriders/create', payload);

    return r;
  }
}
