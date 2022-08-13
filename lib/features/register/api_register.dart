import 'package:antaranter_driverapp/framework/api1.dart';

class ApiRegister {
  //contoh
  Future<dynamic> uploadImg({required String imageItem}) async {
    var response = Api1().apiUploadImageWithToken(imageItem, 'upload');
    // log('cek imgKTP : ' + upload.toString());

    return response;
  }

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

  Future<dynamic> updateUserAccount({
    required var name,
    required var email,
    required var gender,
    required var nik,
    required var ktp,
    required var img,
    required var birth,
    required var address,
    required var phone,
    required var city,
    required var idRider,
    required var status,
  }) async {
    final inputBody = {
      "name": name,
      "email": email,
      "gender": gender,
      "nik": nik,
      "ktp_pict": ktp,
      "image": img,
      "birth": birth,
      "address": address,
      "phone": phone,
      "cityLocation": city,
      "status": status,
    };

    var apiUserAccountRespons = await Api1()
        .apiJSONPostWithToken('riders/update-profile/$idRider', inputBody);

    return apiUserAccountRespons;
  }

  Future<dynamic> updateVehicleAccount({
    required var simNum,
    required var simExp,
    required var simPict,
    required var platNum,
    required var vehicleVar,
    required var vehicleCol,
    required var stnkPict,
    required var idRider,
    required var idRiderNebeng,
  }) async {
    final inputBody = {
      "rider_id": idRider,
      "sim": simNum,
      "simExp": simExp,
      "simPict": simPict,
      "plat_number": platNum,
      "vehicle_variant": vehicleVar,
      "vehicle_color": vehicleCol,
      "stnkPict": stnkPict,
    };

    var apiVehicleAccountResponse = await Api1()
        .apiJSONPostWithToken('nebengriders/update/$idRiderNebeng', inputBody);

    return apiVehicleAccountResponse;
  }

  Future<dynamic> updateNebengRider({
    required var riderId,
  }) async {
    final inputBody = {
      "rider_id": riderId,
    };

    var apiNebengRider = await Api1()
        .apiJSONPostWithToken('nebengriders/findbyrider', inputBody);
    return apiNebengRider;
  }

  Future<dynamic> createAgreement({
    required int idRider,
    required int status,
  }) async {
    final payload = {
      "rider_id": idRider,
      "status": status,
    };

    var r = await Api1().apiJSONPostWithToken('agreements/create', payload);
    return r;
  }

  Future<dynamic> createNebengRider({
    required int idRider,
  }) async {
    final payload = {
      "rider_id": idRider,
    };

    var r = await Api1().apiJSONPost('register-nebeng-rider', payload);

    return r;
  }

  Future<dynamic> termNebeng() async {
    var response = await Api1().apiJSONGetWitToken("terms/1");

    return response;
  }

  Future<dynamic> autoLogin({
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

  Future<dynamic> getProvince() async {
    var responseProvince = await Api1().apiJSONGetWitToken("provincies/list");

    return responseProvince;
  }

  Future<dynamic> getCity({required int idProvince}) async {
    final bodyProvince = {"province_id": idProvince};
    var responseCity = await Api1()
        .apiJSONPostWithToken("cities/findbyprovince", bodyProvince);

    return responseCity;
  }

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

    Future<dynamic> agreementByRiderId({required int riderId}) async {
    final body = {
      'rider_id': riderId,
    };
    var r = await Api1().apiJSONPostWithToken('agreements/findbyrider', body);
    return r;
  }

  
}
