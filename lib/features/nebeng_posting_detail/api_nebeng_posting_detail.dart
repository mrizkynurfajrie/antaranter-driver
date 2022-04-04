import 'dart:developer';

import 'package:intake_rider/framework/api1.dart';

class ApiNebengPostingDetail {
  Future<dynamic> detailNebengPosting({required var riderId}) async {
    final bodyNebengPosting = {"rider_id": riderId};
    var responseNebengPosting = await Api1()
        .apiJSONPostWithToken('nebengposts/findbyrider', bodyNebengPosting);

    return responseNebengPosting;
  }

  Future<dynamic> updateSchedule({
    required var postingId,
    required var timeDep,
    required var timeArrv,
  }) async {
    final bodyIdPosting = {
      "id": postingId,
      "timeDep": timeDep,
      "timeArrv": timeArrv,
    };
    var responUpdateSchedule =
        await Api1().apiJSONPostWithToken('updateschedule', bodyIdPosting);

    return responUpdateSchedule;
  }

  Future<dynamic> deletePosting ({required var nebengPostingId, required var note,}) async {
    final bodyHapus = {"nebeng_posting_id" : nebengPostingId, "note" : note};
    
  }
}
