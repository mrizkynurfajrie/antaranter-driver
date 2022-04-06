import 'dart:convert';

import 'package:intake_rider/response/main_rider.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    this.rider,
  });

  MainRider? rider;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        rider: json["rider"] == null ? null : MainRider.fromJson(json["rider"]),
      );

  Map<String, dynamic> toJson() => {
        "rider": rider?.toJson(),
      };
}
