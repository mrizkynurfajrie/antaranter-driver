import 'dart:developer';

import 'package:antaranter_driverapp/framework/api1.dart';

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
    required desc,
    required isUrgent
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
      "desc": desc,
      "is_urgent": isUrgent,
    };
    var responsePosting =
        await Api1().apiJSONPostWithToken('nebengposts/create', bodyPosting);
    log('nebeng posting : ' + responsePosting.toString());
    return responsePosting;
  }

  Future<dynamic> getBalance({required var riderId}) async {
    final body = {"rider_id": riderId};
    var response =
        await Api1().apiJSONPostWithToken("balance/findbyrider", body);
    return response;
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

  Future<dynamic> getCityByRegion({required int idRegion}) async {
    final body = {"region_id" : idRegion};
    var response = await Api1().apiJSONPostWithToken("cities/listbyregion", body);

    return response;
  }
}
