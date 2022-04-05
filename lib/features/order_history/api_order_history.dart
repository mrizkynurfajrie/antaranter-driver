import 'package:intake_rider/framework/api1.dart';

class ApiOrderHistory {
  Future<dynamic> getHistoryPosting({
    required int id,
  }) async {
    final payload = {
      "rider_id": id,
    };

    var r = await Api1().apiJSONPostWithToken(
      "nebengposts/liststatusclosedabortedbyrider",
      payload,
    );
    return r;
  }
}
