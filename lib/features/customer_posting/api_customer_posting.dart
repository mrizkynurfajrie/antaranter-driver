import 'dart:developer';

import 'package:antaranter_driverapp/framework/api1.dart';

class ApiCustomerPosting {
  Future<dynamic> listCustNebeng({required int id}) async {
    final data = {"rider_id": id};
    var response = await Api1().apiJSONPostWithToken(
        "nebengpostscustomer/listopenbyriderregion", data);

    log("list status open : " + response.toString());
    return response;
  }

  Future<dynamic> cities({required int id}) async {
    final data = {
      "region_id": id,
    };
    var response =
        await Api1().apiJSONPostWithToken("cities/listbyregion", data);
    log('return data city = ' + response.toString());

    return response;
  }
}
