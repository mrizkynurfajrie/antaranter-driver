// To parse this JSON data, do
//
//     final provinceResponse = provinceResponseFromJson(jsonString);


import 'dart:convert';

provinceResponse provinceResponseFromJson(String str) => provinceResponse.fromJson(json.decode(str));

String provinceResponseToJson(provinceResponse data) => json.encode(data.toJson());

class provinceResponse {
    provinceResponse({
         this.id,
         this.name,
         this.createdAt,
         this.updatedAt,
         this.isDeleted,
         this.deletedAt,
         this.countryId,
    });

    int? id;
    String? name;
    String? createdAt;
    String? updatedAt;
    String? isDeleted;
    String? deletedAt;
    int? countryId;

    factory provinceResponse.fromJson(Map<String, dynamic> json) => provinceResponse(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
        deletedAt: json["deletedAt"],
        countryId: json["country_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
        "deletedAt": deletedAt,
        "country_id": countryId,
    };
}
