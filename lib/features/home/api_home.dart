import 'package:antaranter_driverapp/framework/api1.dart';

class ApiHome {
  Future<dynamic> riderHome(int id) async {
    var response = await Api1().apiJSONGetWitToken('home/rider/$id');

    return response;
  }

  Future<dynamic> detailNebengPosting({required var riderId}) async {
    final bodyNebengPosting = {"rider_id": riderId};
    var responseNebengPosting = await Api1()
        .apiJSONPostWithToken('nebengposts/findbyrider', bodyNebengPosting);

    return responseNebengPosting;
  }
}
