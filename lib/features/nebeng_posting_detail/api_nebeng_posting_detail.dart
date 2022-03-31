import 'dart:developer';

import 'package:intake_rider/framework/api1.dart';

class ApiNebengPostingDetail {
  Future<dynamic> detailNebengPosting({required var riderId}) async {
    final bodyNebengPosting = {"rider_id" : riderId};
    var responseNebengPosting =
        await Api1().apiJSONPostWithToken('nebengposts/findbyrider', bodyNebengPosting);
    log('response nebeng post : ' + responseNebengPosting.toString());
    return responseNebengPosting;
  }
}
