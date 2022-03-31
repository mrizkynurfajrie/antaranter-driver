import 'dart:developer';

import 'package:intake_rider/framework/api1.dart';

class ApiNebengPosting {
  Future<dynamic> postingNebeng({
    required idRider,
    required cityOrigin,
    required cityDestination,
    required dateDep,
    required dateArr,
    required timeDep,
    required timeArr,
    required seatAvail,
    required price,
  }) async {
    final bodyPosting = {
      "rider_id": idRider,
      "city_origin": cityOrigin,
      "city_destination": cityDestination,
      "dateDep": dateDep,
      "dateArr": dateArr,
      "timeDep": timeDep,
      "timeArr": timeArr,
      "seatAvail": seatAvail,
      "price": price,
    };
    log('suka suka : ' +bodyPosting.toString());
    var responsePosting =
        await Api1().apiJSONPostWithToken('nebengposts/create', bodyPosting);
    log('nebeng posting : ' + responsePosting.toString());
    return responsePosting;
  }

  Future<dynamic> getVehicleInfo({required var riderId}) async {
    final bodyVehicle = {"rider_id": riderId};
    var responseVehicle = await Api1()
        .apiJSONPostWithToken('nebengriders/findbyrider', bodyVehicle);

    return responseVehicle;
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
}