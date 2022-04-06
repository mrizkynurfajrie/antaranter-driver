// To parse this JSON data, do
//
//     final vehicle = vehicleFromJson(jsonString);

import 'dart:convert';

import 'package:antaranter_driverapp/response/main_rider.dart';

NebengRider vehicleFromJson(String str) =>
    NebengRider.fromJson(json.decode(str));

String vehicleToJson(NebengRider data) => json.encode(data.toJson());

class NebengRider {
  NebengRider({
    this.id,
    this.riderId,
    this.statusNebeng,
    this.sim,
    this.simPict,
    this.simExp,
    this.stnkPict,
    this.accountApproved,
    this.lat,
    this.lang,
    this.rating,
    this.approvedBy,
    this.vehicleVariant,
    this.platNumber,
    this.vehicleColor,
    this.accountRegis,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.mainRider,
  });

  int? id;
  int? riderId;
  int? statusNebeng;
  String? sim;
  String? simPict;
  DateTime? simExp;
  String? stnkPict;
  DateTime? accountApproved;
  double? lat;
  double? lang;
  int? rating;
  int? approvedBy;
  String? vehicleVariant;
  String? platNumber;
  String? vehicleColor;
  DateTime? accountRegis;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isDeleted;
  MainRider? mainRider;


  factory NebengRider.fromJson(Map<String, dynamic> json) => NebengRider(
        id: json["id"],
        riderId: json["rider_id"],
        statusNebeng: json["statusNebeng"],
        sim: json["sim"],
        simPict: json["simPict"],
        simExp: json["simExp"] == null ? null : DateTime.parse(json["simExp"]),
        stnkPict: json["stnkPict"],
        accountApproved: json["account_approved"] == null
            ? null
            : DateTime.parse(json["account_approved"]),
        lat: json["lat"]?.toDouble(),
        lang: json["lang"]?.toDouble(),
        rating: json["rating"],
        approvedBy: json["approvedBy"],
        vehicleVariant: json["vehicle_variant"],
        platNumber: json["plat_number"],
        vehicleColor: json["vehicle_color"],
        accountRegis: json["account_regis"] == null
            ? null
            : DateTime.parse(json["account_regis"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        mainRider: json["main_rider"] == null ? null : MainRider.fromJson(json["main_rider"])
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "statusNebeng": statusNebeng,
        "sim": sim,
        "simPict": simPict,
        "simExp":
            "${simExp?.year.toString().padLeft(4, '0')}-${simExp?.month.toString().padLeft(2, '0')}-${simExp?.day.toString().padLeft(2, '0')}",
        "stnkPict": stnkPict,
        "account_approved": accountApproved?.toIso8601String(),
        "lat": lat,
        "lang": lang,
        "rating": rating,
        "approvedBy": approvedBy,
        "vehicle_variant": vehicleVariant,
        "plat_number": platNumber,
        "vehicle_color": vehicleColor,
        "account_regis": accountRegis?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "main_rider": mainRider,
      };
  factory NebengRider.fromArguments(Map<String, dynamic> json) => NebengRider(
        id: json["id"],
        riderId: json["rider_id"],
        statusNebeng: json["statusNebeng"],
        sim: json["sim"],
        simPict: json["simPict"],
        simExp: json["simExp"],
        stnkPict: json["stnkPict"],
        lat: json["lat"],
        lang: json["lang"],
        rating: json["rating"],
        vehicleVariant: json["vehicle_variant"],
        platNumber: json["plat_number"],
        vehicleColor: json["vehicle_color"],
        mainRider: json["main_rider"],
      );
}
