// To parse this JSON data, do
//
//     final mainRider = mainRiderFromJson(jsonString);

import 'dart:convert';

MainRider mainRiderFromJson(String str) => MainRider.fromJson(json.decode(str));

String mainRiderToJson(MainRider data) => json.encode(data.toJson());

class MainRider {
    MainRider({
        this.id,
        this.name,
        this.email,
        this.nik,
        this.ktpPict,
        this.image,
        this.birth,
        this.address,
        this.phone,
        this.password,
        this.status,
        this.accountApprove,
        this.cityLocation,
        this.role,
        this.fcm,
        this.gender,
        this.accountRegis,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    String? name;
    String? email;
    String? nik;
    String? ktpPict;
    String? image;
    DateTime? birth;
    String? address;
    String? phone;
    String? password;
    int? status;
    DateTime? accountApprove;
    String? cityLocation;
    String? role;
    String? fcm;
    String? gender;
    DateTime? accountRegis;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory MainRider.fromJson(Map<String, dynamic> json) => MainRider(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        nik: json["nik"],
        ktpPict: json["ktp_pict"],
        image: json["image"],
        birth: json["birth"] == null ? null : DateTime.parse(json["birth"]),
        address: json["address"],
        phone: json["phone"],
        password: json["password"],
        status: json["status"],
        accountApprove: json["account_approve"] == null ? null : DateTime.parse(json["account_approve"]),
        cityLocation: json["cityLocation"],
        role: json["role"],
        fcm: json["fcm"],
        gender: json["gender"],
        accountRegis: json["account_regis"] == null ? null : DateTime.parse(json["account_regis"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "nik": nik,
        "ktp_pict": ktpPict,
        "image": image,
        "birth": birth ,
        "address": address,
        "phone": phone,
        "password": password,
        "status": status,
        "account_approve": accountApprove ,
        "cityLocation": cityLocation,
        "role": role,
        "fcm": fcm,
        "gender": gender,
        "account_regis": accountRegis ,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };

    factory MainRider.fromArguments(Map<String, dynamic> json) => MainRider(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        nik: json["nik"],
        ktpPict: json["ktp_pict"],
        image: json["image"],
        birth: json["birth"],
        address: json["address"],
        phone: json["phone"],
        password: json["password"],
        status: json["status"],
        accountApprove: json["account_approve"],
        cityLocation: json["cityLocation"],
        role: json["role"],
        fcm: json["fcm"],
        gender: json["gender"],
        accountRegis: json["account_regis"],
        isDeleted: json["isDeleted"],
    );
}
