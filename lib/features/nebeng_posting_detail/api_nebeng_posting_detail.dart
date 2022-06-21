import 'dart:developer';

import 'package:antaranter_driverapp/framework/api1.dart';

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
      "timeArr": timeArrv,
    };
    var responUpdateSchedule = await Api1()
        .apiJSONPostWithToken('nebengposts/updateschedule', bodyIdPosting);

    return responUpdateSchedule;
  }

  Future<dynamic> deletePosting({
    required var nebengPostingId,
    required var note,
  }) async {
    final bodyHapus = {"nebeng_posting_id": nebengPostingId, "note": note};
    var responHapus =
        await Api1().apiJSONPostWithToken('nebengposts/cancelpost', bodyHapus);

        log('delete post : ' + responHapus.toString());

    return responHapus;
  }

  Future<dynamic> changeStatus({
    required var status,
    required var nebengPostId,
    required var dateTimeStart,
  }) async {
    final body = {
      "status": status,
      "nebeng_post_id": nebengPostId,
      "datetimeStart": dateTimeStart,
    };
    log("log body update status : " + body.toString());
    var responHapus =
        await Api1().apiJSONPostWithToken('nebengposts/updatestatus', body);

    return responHapus;
  }

  Future<dynamic> updateBalance({
    required var nebengPostId,
    required var datetimeFinish,
  }) async {
    final body = {
      "nebeng_posting_id": nebengPostId,
      "datetimeFinish": datetimeFinish,
    };
    var responUpdateBalance =
        await Api1().apiJSONPostWithToken("nebengorders/statusdone", body);

    return responUpdateBalance;
  }
}
