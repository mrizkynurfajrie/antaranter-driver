import 'dart:developer';

import 'package:intake_rider/framework/api1.dart';

class ApiUserAccount {
  Future<dynamic> updateUserAccount({
    required var name,
    required var email,
    required var nik,
    required var ktp,
    required var img,
    required var birth,
    required var address,
    required var phone,
    required var city,
    required var idRider,
  }) async {
    final inputBody = {
      "name": name,
      "email": email,
      "nik": nik,
      "ktp_pict": ktp,
      "image": img,
      "birth": birth,
      "address": address,
      "phone": phone,
      "cityLocation": city,
    };

    var apiUserAccountRespons = await Api1()
        .apiJSONPostWithToken('riders/update-profile/$idRider', inputBody);

    return apiUserAccountRespons;
  }

  Future<dynamic>uploadProfileImg({required String profileImg}) async {
    var upload = Api1().apiJSONMultipartWithToken(profileImg, 'upload');

    return upload;
  }

  Future<dynamic>uploadKtpImg({required String ktpImg}) async {
    var upload = Api1().apiJSONMultipartWithToken(ktpImg, 'upload');

    return upload;
  }

   Future<dynamic> getProvince() async {
    var responseProvince = await Api1().apiJSONGetWitToken("provincies/list");
    log('provinsi : ' + responseProvince.toString());
    return responseProvince;
  }

  Future<dynamic> getCity({required int idProvince}) async {
    final bodyProvince = {"province_id": idProvince};
    var responseCity = await Api1()
        .apiJSONPostWithToken("cities/findbyprovince", bodyProvince);

    return responseCity;
  }
}
