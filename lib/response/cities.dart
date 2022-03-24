import 'dart:convert';

citiesResponse citiesResponseFromJson(String str) => citiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(citiesResponse data) => json.encode(data.toJson());

class citiesResponse {
  citiesResponse({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.provinceId,
  });

  int id;
  String name;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int provinceId;

  factory citiesResponse.fromJson(Map<String, dynamic> json) => citiesResponse(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        provinceId: json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "province_id": provinceId,
      };
}
