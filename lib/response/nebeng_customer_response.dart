// To parse this JSON data, do
//
//     final nebengCustomerResponse = nebengCustomerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:antaranter_driverapp/response/users.dart';

NebengCustomerResponse nebengCustomerResponseFromJson(String str) =>
    NebengCustomerResponse.fromJson(json.decode(str));

String nebengCustomerResponseToJson(NebengCustomerResponse data) =>
    json.encode(data.toJson());

class NebengCustomerResponse {
  NebengCustomerResponse({
    this.id,
    this.userId,
    this.genderPref,
    this.cityOrigin,
    this.cityDestination,
    this.dateDep,
    this.status,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.user,
  });

  int? id;
  int? userId;
  String? genderPref;
  String? cityOrigin;
  String? cityDestination;
  DateTime? dateDep;
  int? status;
  String? desc;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isDeleted;
  Users? user;

  factory NebengCustomerResponse.fromJson(Map<String, dynamic> json) =>
      NebengCustomerResponse(
        id: json["id"],
        userId: json["user_id"],
        genderPref: json["gender_pref"],
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep:
            json["dateDep"] == null ? null : DateTime.parse(json["dateDep"]),
        status: json["status"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        user: json["user"] == null ? null : Users.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "gender_pref": genderPref,
        "city_origin": cityOrigin,
        "city_destination": cityDestination,
        "dateDep": dateDep,
        "status": status,
        "desc": desc,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
        "user": user?.toJson(),
      };

  factory NebengCustomerResponse.fromArguments(Map<String, dynamic> json) =>
      NebengCustomerResponse(
        id: json["id"],
        userId: json["user_id"],
        genderPref: json["gender_pref"],
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep: json["dateDep"],
        status: json["status"],
        desc: json["desc"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
        user: Users.fromArguments(json["user"]),
      );
}
