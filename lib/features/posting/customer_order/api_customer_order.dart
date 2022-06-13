import 'dart:developer';

import 'package:antaranter_driverapp/framework/api1.dart';

class ApiCustomerOrder {
  Future<dynamic> createCustomerOrder({
    required int nebengPostId,
    required int customerNebengPostId,
  }) async {
    final inputBody = {
      "nebeng_posting_id": nebengPostId,
      "customer_nebeng_posting_id": customerNebengPostId,
    };

    log("body data customer : " + inputBody.toString());
    var response = await Api1()
        .apiJSONPostWithToken("nebengorders/createbycustomerpost", inputBody);

    return response;
  }
}
