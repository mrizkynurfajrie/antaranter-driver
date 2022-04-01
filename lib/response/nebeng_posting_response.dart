import 'dart:convert';

import 'package:intake_rider/response/main_rider.dart';
import 'package:intake_rider/response/nebeng_order.dart';
import 'package:intake_rider/response/nebeng_posting.dart';
import 'package:intake_rider/response/nebeng_rider.dart';

NebengPostingResponse nebengPostingResponseFromJson(String str) =>
    NebengPostingResponse.fromJson(json.decode(str));

String nebengPostingResponseToJson(NebengPostingResponse data) =>
    json.encode(data.toJson());

class NebengPostingResponse {
  NebengPostingResponse({
    this.nebengPosting,
    // this.nebengOrder,
    this.nebengRider,
    this.mainRider,
  });

  NebengPosting? nebengPosting;
  // NebengOrder? nebengOrder;
  NebengRider? nebengRider;
  MainRider? mainRider;

  factory NebengPostingResponse.fromJson(Map<String, dynamic> json) =>
      NebengPostingResponse(
        nebengPosting: NebengPosting.fromJson(json["post"]),
        // nebengOrder: NebengOrder.fromJson(json["nebeng_order"]),
        nebengRider: NebengRider.fromJson(json["nebeng_rider"]),
        mainRider: MainRider.fromJson(json["main_rider"]),
      );

  Map<String, dynamic> toJson() => {
        "post": nebengPosting?.toJson(),
        // "nebengOrder": nebengOrder?.toJson(),
        "nebeng_rider": nebengRider?.toJson(),
        "main_rider": mainRider?.toJson(),
      };
}
