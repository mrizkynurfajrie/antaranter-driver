import 'dart:convert';

import 'package:antaranter_driverapp/response/main_rider.dart';
import 'package:antaranter_driverapp/response/region.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    this.rider,
    this.region,
  });

  MainRider? rider;
  Region? region;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        rider: json["rider"] == null ? null : MainRider.fromJson(json["rider"]),
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "rider": rider?.toJson(),
        "region": region?.toJson(),
      };
}
